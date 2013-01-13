#!/usr/bin/perl

use warnings;
use strict;

# load data
open MNEMO, "<README.md" or die $!;
my @mnemo = <MNEMO>;
my $table = [];		# array of hash; will store the created images but not the empty ones
my $images = 0;		# number of images

# write existing images into $table
for (my $line = 0; $line <= $#mnemo; $line++) {
	if ($mnemo[$line] =~ /^\d\d/) {
		if ($mnemo[$line] =~ /^(\d\d) \((.*)\) \((.*)\) \((.*)\)/) {
			$table->[$images] = [$1, $2, $3, $4];
		$images++;
		}
	$line++;
	}
}
print "Number of images found = $images\n";
print "Give empty input for question, any input to quit\n";

# create random PAO-sets until program quit
while (<> eq "\n") {
	my $ask = [];
	for (my $n = 0; $n <= 2; $n++) {
		$ask->[$n] = int(rand($images));
	}

	print "question: $table->[$ask->[0]]->[0]$table->[$ask->[1]]->[0]$table->[$ask->[2]]->[0]";
	<>;
	print "answer: ($table->[$ask->[0]]->[1]) ($table->[$ask->[1]]->[2]) ($table->[$ask->[2]]->[3])\n";
	print "==============================\n";
	print "Give empty input for question, any input to quit\n";
}

exit 0;
