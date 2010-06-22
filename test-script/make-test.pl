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

if (!defined($P3DFFT_CONFIGURE) || !defined($P3DFFT_CONFIGURE2) || !defined($DIMS) || !defined($TEST_PATH)) {
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

print "Copying src to test1\n";
system("cp -ar src test1");

print "Copying src to test2\n";
system("cp -ar src test2");

print "======================================================\n";
print "                  Begin configure and build\n";
print "======================================================\n\n";

# Test 1

chdir("$cwd/test1");

print "Configuring test1\n$P3DFFT_CONFIGURE\n";
$configure_status = system("$P3DFFT_CONFIGURE");
if ($configure_status > 0) {
	die("\n\nConfigure test1 failed: $P3DFFT_CONFIGURE\n\n");
}

#system("mv $cwd/test1/sample/FORTRAN/*.x

print "Running make test1...\n";
$make_status = system("make");
if ($make_status > 0) {
	die("\n\nMake test1 failed, please see above\n\n");
}

## Test 2

chdir("$cwd/test2");

print "Configuring test2\n$P3DFFT_CONFIGURE2\n";
$configure_status = system("$P3DFFT_CONFIGURE2");
if ($configure_status > 0) {
        die("\n\nConfigure test2 failed: $P3DFFT_CONFIGURE2\n\n");
}

print "Running make test2...\n";
$make_status = system("make");
if ($make_status > 0) {
        die("\n\nMake test2 failed, please see above\n\n");
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

chdir("$cwd/test1/sample");

