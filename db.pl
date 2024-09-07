use strict;
use warnings;
use DBI;

sub db_init{
	my ($filepath)=$_[0];
	return DBI->connect("dbi:SQLite:$filepath","","",{
		PrintError=>1,
		RaiseError=>1,
		AutoCommit=>1
	});
}

sub db_insert{
	my ($db)=$_[0];
	my (%args)=%{$_[1]};
	if( ! exists $args{descr} ){
		$args{descr}='-';
	}
	return $db->do(
		"INSERT INTO trick(title,tags,descr)  VALUES(?,?,?)",
		undef, $args{title},$args{tags},$args{descr}
	);
}

sub db_getby{
	if($#_<2){
		print STDERR 'db_getby:not enough args\n';
		return;
	}
	my ($db)=$_[0];
	my ($field)=$_[1];
	my ($arg)=$_[2];
	
	# db
	my ($st)=$db->prepare("SELECT * FROM trick WHERE ? LIKE ?");
	$st->execute($field,'%'.$arg.'%');
	return to_result($st);
}

sub db_getby_title{
	return db_getby($_[0],'title',$_[1]);
}

sub db_getby_tags{
	return db_getby($_[0],'tags',$_[1]);
}

sub db_getby_both{
	if($#_<1){
		print STDERR 'db_getby_both:not enough args\n';
		return;
	}
	my ($db)=$_[0];	
	my (%args)=%{$_[1]};

	#	db
	my ($st)=$db->prepare(
		"SELECT * FROM trick WHERE tags LIKE ? OR title LIKE ?"
	);
	$st->execute('%'.$args{tags}.'%','%'.$args{title}.'%');
	return to_result($st);
}

sub to_result{
	my ($st)=$_[0];

	# reaing result
	my (@res)=();
	while( my @row=$st->fetchrow_array){
		splice(@res,0,0,\@row);
	}
	return @res;
}
