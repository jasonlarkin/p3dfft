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

chdir($TEST_PATH);

$cwd = getcwd();

print "======================================================\n";
print "                  Begin Setup\n";
print "======================================================\n\n";

print "Getting P3DFFT source from SVN\n";
system("svn checkout http://p3dfft.googlecode.com/svn/branches/p3dfft-f90 src");

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
	print "Script ended\n";
}

print "======================================================\n";
print "                  Begin tests\n";
print "======================================================\n\n";

for ($count = 0; $count < $total_tests; $count++) {
	chdir("$cwd/test$count/sample");
	@tests = glob ("*f.x*");
	foreach (@tests) {
		system("mpirun -np $NUM_PROC $_");
	}
}

