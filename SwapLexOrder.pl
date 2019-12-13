#!/usr/bin/perl
use strict;

sub swapLexOrder {
	my ($str, $pairs) = @_;
    my @str = split '', $str;
    my @pairs = @$pairs;
    my @graph;
    return @str if !@pairs;
    # convert $pairs to @graph
    for(my $r = 0; $r <= $#pairs; ++$r) {
        push @{$graph[$pairs[$r][0]-1]}, $pairs[$r][1]-1;
        push @{$graph[$pairs[$r][1]-1]}, $pairs[$r][0]-1;
    }
    print "Graph:$/";
    for(@graph) {
        print join ', ', @$_ if $_;
        print $/;
    }
    my @lsts;
    my %visited;
    # convert @graph to list of lists
    for(my $r = 0; $r <= $#graph; ++$r) {
        my @queue;
        push @queue, $r;
        do {
            my $leader = shift @queue;
            push @{$lsts[$r]}, $leader if !$visited{$leader};
            $visited{$leader} = 1;
            for(@{$graph[$leader]}) {
                push @queue, $_ if $_ and !$visited{$_};
            }
        } while($#queue > -1);
    }
    
    # generate lsts to be sorted
    my @sets = ([]);
    for(my $r = 0; $r <= $#lsts; ++$r) {
        for(my $i = 0; $i <= $#{$lsts[$r]}; ++$i) {
            push @{$sets[$r]}, $str[$lsts[$r][$i]] if $str[$lsts[$r][$i]];
        }
    }
    # sort each set
    for(my $r = 0; $r <= $#sets; ++$r) {
        @{$sets[$r]} = sort {$b cmp $a} @{$sets[$r]} if $sets[$r];
        @{$lsts[$r]} = sort {$a <=> $b} @{$lsts[$r]} if $lsts[$r];
    }
    # print debugging
    for(@lsts) {
        print join ', ', @$_ if $_;
        print $/;
    }
    for(@sets) {
        print join ', ', @$_ if $_;
        print $/;
    } 
    #assemble sets
    for(my $r = 0; $r <= $#lsts; ++$r) {
        for(my $c = 0; $c <= $#{$lsts[$r]}; ++$c) {
            $str[$lsts[$r][$c]] = $sets[$r][$c];
        }
    }
   return join '', @str;
}

my $str = "fixmfbhyutghwbyezkveyameoamqoi";
my @pairs = (
    [8,5], 
    [10,8], 
    [4,18], 
    [20,12], 
    [5,2], 
    [17,2], 
    [13,25], 
    [29,12], 
    [22,2], 
    [17,11]
    );
print swapLexOrder $str, \@pairs;
