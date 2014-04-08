#!/usr/bin/perl
# A simple trap handler
my $TRAP_FILE = "/tmp/traps.all.log";

my $host = <STDIN>; # Read the Hostname - First line of input from STDIN
 chomp($host);
my $ip = <STDIN>;   # Read the IP - Second line of input
 chomp($ip);

while(<STDIN>) {
        chomp($_);
        push(@vars,$_);
}

open(TRAPFILE, ">> $TRAP_FILE");
$date = `date`;
chomp($date);
print(TRAPFILE "New trap received: $date for $OID\n\nHOST: $host\nIP: $ip\n");
foreach(@vars) {
        print(TRAPFILE "TRAP: $_\n");
}
print(TRAPFILE "\n----------\n");
close(TRAPFILE);
