#!/usr/bin/perl -w
use strict;

sub sumOfTwo {
    # get parameters
	my @a = @{shift @_};
	my @b = @{shift @_};
    my $v = shift;
    # hash where key = value - a[i], true
    # v = a[i] + b[j]
    # v - a[i] = b[j]
    my %hash;
    for my $num (@a) {
        $hash{$v - $num} = 1;
    }
    for my $num (@b) {
        if($hash{$num}) {
            return 1;
        }
    }
    return 0;
}

