#!/usr/bin/env perl

use warnings;
use strict;

use FindBin;
use lib "$FindBin::Bin/../lib";
use Time::HiRes qw(gettimeofday tv_interval);

use Auth;

my $users = [ qw(matt john bob frank sarah suzy jessica aaaaa bbbbb aabbcc) ];

my $auth = Auth->new;

my $results = {};

foreach my $n (0 .. 10) { 
    foreach my $user (@$users) {
        my $start = [gettimeofday];
        my $valid_user = $auth->valid_user($user, 'fakepassword');
        my $time = tv_interval($start);
        push @{ $results->{$user}->{'times'} }, $time;
        $results->{$user}->{'count'}++;
        $results->{$user}->{'sum'} +=  $time;
    }
}

foreach my $user (sort keys %$results) {
    my $result = $results->{$user};
    my $average = $result->{'count'} ? sprintf("%.6f", $result->{'sum'} / $result->{'count'}) : 0;
    print "User: $user\tAverage: $average\n";
}
