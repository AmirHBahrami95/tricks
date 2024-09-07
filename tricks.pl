use strict;
use warnings;

sub put{
	my ($db)=$_[0];
	my (%args)=%{$_[1]};
	print db_insert($db,\%args)?"200 OK\n":"400 Bad Request (bitch!)\n";
}

sub get{
	my ($db)=$_[0];
	my (%args)=%{$_[1]};
	my (@rows)=[];
	if(exists $args{title} && exists $args{tags}){
		@rows=db_getby_both($db,\%args);
	}
	elsif(exists $args{title}){
		@rows=db_getby_title($db,\$args{title});
	}
	elsif(exists $args{tags}){
		@rows=db_getby_tags($db,\$args{tags});
	}
	return @rows;
}

sub print_rows{
	my (@array)=@_;
	my (@row);
	foreach my $i(@array){
		@row=@{$i};
		print "title:$row[0]\ntags:$row[1]";
		print "\ndescr:$row[2]" if ($row[2]);
		print "\n=======\n";
	}	
}
