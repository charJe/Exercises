#!/usr/bin/perl
use strict;

sub sherlockAndAnagrams {
    my $s = $_[0];
    my $count = 0;
    my $limit = length($s);
    for (my $len = 1; $len < $limit; ++$len) {
        for (my $i1 = 0; $i1 + $len <= $limit; ++$i1) {
            my $str1;
            for (my $i2 = $i1 + 1; $i2 + $len <= $limit; ++$i2) {
                if ($i1 != $i2 && isAnagram(substr($s, $i1, $len), substr($s, $i2, $len))) {
                    ++$count;
                }
            }
        }
    }
    return $count;
}

sub isAnagram {
    my $s1 = $_[0];
    my $s2 = $_[1];
    my @checkList;
    for(my $i = 0; $i < length($s1); ++$i) {
        $checkList[ord(substr($s1, $i, 1))-97]++;
        $checkList[ord(substr($s2, $i, 1))-97]--;
    }
    foreach my $check (@checkList) {
        return 0 if(defined($check) && $check != 0)
    }
    return 1;
}

print(sherlockAndAnagrams("ifailuhkqq"));
