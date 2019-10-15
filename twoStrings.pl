#!/usr/bin/perl -w
use strict;

sub twoStrings {
    my @s1 = split('', shift(@_));
    my @s2 = split('', shift(@_));
    my %letters1;
    for (my $i = 0; $i < $#s1; ++$i) {
        $letters1{$s1[$i]} = 1;
    }
    for (my $i = 0; $i < $#s2; ++$i) {
    	if($letters1{$s2[$i]}) {
            return "YES";
        }
    }
    return "NO";
}
