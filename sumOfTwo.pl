#!/usr/bin/perl -w
use strict;

sub sumOfTwo {
    # get parameters
	my @a = @{shift @_};
	my @b = @{shift @_};
    my $v = shift;
    # hash where key = value - a[i], value = true
    # v = a[i] + b[j]
    # v - a[i] = b[j]
    my %hash;
    for my $num (@a) {
        $hash{$v - $num} = 1;
    }
    for my $num (@b) {
        if( exists $hash{$num}) {
            return 1;
        }
    }
    return 0;
}

my @a = (10, 1, 5, 3, 8);
my @b = (100, 6, 3, 1, 5);
my $v = 4;
print sumOfTwo(\@a, \@b, $v);
