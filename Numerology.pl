use strict;
use warnings;

my ($name, $name_full, $numeralogy, @name, %alpha_numeric);

%alpha_numeric = (A=>1, B=>2, C=>3, D=>4, E=>5, F=>8, G=>3, H=>5, I=>1, J=>1, K=>2, L=>3, M=>4,
N=>5, O=>7, P=>8, Q=>1, R=>2, S=>3, T=>4, U=>6, V=>6, W=>6, X=>5, Y=>1, Z=>7);

START : system ("cls");
print "\nPlease enter a name.\n";
$name = <STDIN>;
print "Please enter a valid name with only alphabets and if required spaces \n" and exit if($name!~/^[a-z A-Z \s]+$/);

$name = uc($name);
$name_full = $name;
chomp $name_full;

print "\nThe entered name is $name \n";

$name =~ s/\s+//g;
@name = split('',$name);
$numeralogy=0;

foreach my $letter (@name)
{
	$numeralogy += 1 if($letter=~/(A|I|J|Q|Y)/);
	$numeralogy += 2 if($letter=~/(B|K|R)/);
	$numeralogy += 3 if($letter=~/(C|G|L|S)/);
	$numeralogy += 4 if($letter=~/(D|M|T)/);
	$numeralogy += 5 if($letter=~/(E|H|N|X)/);
	$numeralogy += 6 if($letter=~/(U|V|W)/);
	$numeralogy += 7 if($letter=~/(O|Z)/);
	$numeralogy += 8 if($letter=~/(F|P)/);
}

print "Number count of $name_full is $numeralogy \n\n";

$numeralogy = add_num($numeralogy);
print "The numeralogy is $numeralogy \n";

iff: print "\nDo you want to continue? Press Y or N.\n";

my $ans = <stdin>;
chomp($ans);
$ans = uc($ans);

if($ans eq 'Y')
{
	goto START;
}
elsif($ans eq 'N')
{
	exit;
}
else
{
	print "\nPlease enter a valid(Y or N) input character.\n";
	goto iff;
}

### Subroutine to add the numbers to get single digit number
sub add_num
{
	my $number = shift;
	my @number = split('',$number);
	$numeralogy=0;
	
	foreach $number (@number)
	{
		$numeralogy += $number;
	}
	add_num($numeralogy) if($numeralogy > 9);
	return $numeralogy;
}
