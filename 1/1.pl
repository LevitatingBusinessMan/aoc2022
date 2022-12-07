use strict;
use warnings;
use List::Util qw(min max);

open(my $in,  "<",  "input") or die "Can't open input.txt: $!";

my @elves = ();
my $currentelf = 0;
while (my $line = <$in>) {
	if (!($line cmp "\n")) {
		push(@elves, $currentelf);
		$currentelf = 0;
	} else {
		$currentelf += $line;
	}
}

print "max ", max(@elves), "\n";

# Part 2
@elves = sort { $b <=> $a } @elves;
print "max first 3 ", $elves[0] + $elves[1] + $elves[2], "\n";
