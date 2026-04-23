#!/usr/bin/perl
use strict;
use warnings;
use IO::Socket::INET;

my $file = 'eicar.com';
my $clamd_host = '127.0.0.1';
my $clamd_port = 3310;

open(my $fh, '<', $file) or die "Cannot open $file: $!";
binmode $fh;
my $data;
{ local $/; $data = <$fh>; }
close $fh;

my $sock = IO::Socket::INET->new(
    PeerAddr => $clamd_host,
    PeerPort => $clamd_port,
    Proto    => 'tcp'
) or die "Cannot connect to clamd: $!";

print $sock "nINSTREAM\n";
my $len = pack('N', length($data));
print $sock $len;
print $sock $data;
print $sock pack('N', 0); # End of stream

while (<$sock>) {
    print;
}
close $sock;
