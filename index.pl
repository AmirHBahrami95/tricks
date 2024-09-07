use strict;
use warnings;
use Getopt::Long;

do './db.pl';
do './tricks.pl';

if($#ARGV<1){
	print "usage: tricks CMD <args>\n";
	print "\tCMD: add get\n";
	print "\tadd <args>: -g \"space separated tags\" -t \"some title\" [-d \"description\"]\n";
	print "\tget <args>: ( -g || -t || -g -t ) [-d]\n";
	# print "\tdel <args>: -t\n";
	exit 1;
}

my %params=(
	title=>'',
	descr=>'',
	tags=>[]
);

GetOptions(
	'g:s'=>\$params{tags},
	'd:s'=>\$params{descr},
	't:s'=>\$params{title}
) or die "you cannot read cmd usage.can u, u little embacile?\n";

# print "title:$params{title}\ntags:$params{tags}\ndescr:$params{descr}\n";

# command processing 
my $cmd=$ARGV[0];
my @res;
my $db=db_init("tricks.db");
if($cmd eq "put" || $cmd eq "add" ){
	put($db,\%params);
}
elsif($cmd eq "get"){
	print_rows(get($db,\%params));
}
elsif($cmd eq "del"){
	print "501 Not Implemented, bitch!\n";
}
else{
	print "400 Bad Request, bitch!\n";
}
$db->disconnect;
# =cut
