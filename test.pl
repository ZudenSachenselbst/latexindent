

@line = <>;
$line = join("", @line);

if($debug){ 
    print $line; 
}

$. = $line;

while($line =~ / 
	(\\frac\{)
		(\s*[^}{]+\s*|\{(?2)+\})+
		(\}\s*\{)
		(\s*[^}{]+\s*|\{(?2)+\})+
	(\})
    /smx ){

	# @field = ($1, $2, $3, $4, $5);
	
	$start_1 = $-[1];
	$end_1   = $+[1];
	$start_2 = $-[2];
	$end_2   = $+[2];
	$start_3 = $-[3];
	$end_3   = $+[3];
	$start_4 = $-[4];
	$end_4   = $+[4];
	$start_5 = $-[5];
	$end_5   = $+[5];

	$f[0] = substr($line, $start_1, $end_1 - $start_1 );

	$f[1] = substr($line, $end_1+1, $start_3 - ($end_1+1) ); 

	$f[2] = substr($line, $start_3, $end_3 - $start_3 );

	$f[3] = substr($line, $end_3+1, $start_5 - ($end_3+1) );

	$f[4] = substr($line, $start_5, $end_5 - $start_5 );

	$count=0;
	foreach my $field (@f ){
	    print $count++ , "=", $field, "\n";
	}
	last;
} 
	
