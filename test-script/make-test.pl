#!/usr/bin/perl
#
#	Test Script for P3DFFT
#
#

use Cwd;

$ENV{LANG} = "C"; # avoid locale related issues/warnings

# check if variables file exists, if not exit
if (!-e "variables.pl") {
	die "Variables file does not exist\n";
}

# import variables
do 'variables.pl';

if (!defined($DIMS) || !defined($TEST_PATH)) {
	die "Please check your variables.pl and make sure all variables are defined!";
}

# clean TEST_PATH or create it if it doesnt exist
if (!-d $TEST_PATH) {
	print "TEST_PATH does not exist, creating...\n";
	system("mkdir $TEST_PATH");
} else {
	print "TEST_PATH exists, removing files\n";
	system("rm -rf $TEST_PATH");
	system("mkdir $TEST_PATH");
}

# make $JOB_PATH if not exists or clean it if it does
if (!-d $JOB_PATH) {
	print "JOB_PATH does not exist, creating...\n";
	system("mkdir $JOB_PATH");
} else {
	print "JOB_PATH exists, removing files\n";
	system("rm -rf $JOB_PATH");
	system("mkdir $JOB_PATH");
}


chdir($TEST_PATH);

$cwd = getcwd();

print "======================================================\n";
print "                  Begin Setup\n";
print "======================================================\n\n";

print "Getting P3DFFT source from SVN\n";
system("svn checkout http://p3dfft.googlecode.com/svn/trunk src");

print "CHMOD configure to executable\n";
system("chmod +x src/configure");

print "Settings DIMS to $DIMS\n";
system("echo $DIMS > src/sample/dims");

for ($count = 0; $count < $total_tests; $count++) {
	print "Copying src to test$count\n";
	system("cp -ar src test$count");
}

print "======================================================\n";
print "                  Begin configure and build\n";
print "======================================================\n\n";


for ($count = 0; $count < $total_tests; $count++) {
	chdir("$cwd/test$count");
	$P3DFFT_CONFIGURE = $CONFIGURE[$count];

	print "Configuring test$count\n$P3DFFT_CONFIGURE\n";
	$configure_status = system("$P3DFFT_CONFIGURE");
	if ($configure_status > 0) {
		die("\n\nConfigure test$count failed: $P3DFFT_CONFIGURE\n\n");
	}

	print "Running make test$count...\n";
	$make_status = system("make");
	if ($make_status > 0) {
		die("\n\nMake test$count failed, please see above\n\n");
	}

	chdir("$cwd/test$count/sample/C");
	system("mv *.x $cwd/test$count/sample");
	chdir("$cwd/test$count/sample/FORTRAN"); 
	system("mv *.x $cwd/test$count/sample/");
}

print "Run tests? [yes]: ";
$| = 1;               # force a flush after our print
$_ = <STDIN>;         # get the input from STDIN (presumably the keyboard)
chomp;

if ($_ eq "") {
# continue
} elsif ($_ eq "yes") {
# continue
} else {
	die "Script aborted\n";
}

print "======================================================\n";
print "                  Begin tests\n";
print "======================================================\n\n";

open(QSUB, ">$cwd/batch.sh");

print QSUB "#!/bin/csh\n";
print QSUB "#PBS -q $QUEUE\n";
print QSUB "#PBS -N $JOB_NAME\n";
print QSUB "#PBS -l nodes=$NODES:ppn=$PROCS_NODE\n";
print QSUB "#PBS -l walltime=$WALLTIME\n";
print QSUB "#PBS -V\n";
print QSUB "#PBS -M $EMAIL\n";
print QSUB "#PBS -m abe\n";
print QSUB "#PBS -o /mirage/djchen/output\n";
print QSUB "#PBS -e /mirage/djchen/error\n";

print QSUB "cd $JOB_PATH\n";

for ($count = 0; $count < $total_tests; $count++) {
	chdir("$cwd/test$count/sample");
	print QSUB "cd $JOB_PATH/test$count/sample\n";
	@tests = glob ("*.x");
	foreach (@tests) {
		print QSUB "echo ======================================================\n";
		print QSUB "echo Starting $_\n";
		print QSUB "echo ======================================================\n";
		print QSUB "mpirun -np $NUM_PROC $_\n";
	}
}

close(QSUB);

print "Moving files\n";
print "mv $cwd/* $JOB_PATH/\n";
system("mv $cwd/* $JOB_PATH/");

print "Submit tests to queue? [yes]: ";
$| = 1;               # force a flush after our print
$_ = <STDIN>;         # get the input from STDIN (presumably the keyboard)
chomp;

if ($_ eq "") {
	die "Script aborted\n";
} elsif ($_ eq "yes") {
# continue
} else {
        die "Script aborted\n";
}

chdir("$JOB_PATH");
system("qsub batch.sh");

print "\nScript Finished!\n";
