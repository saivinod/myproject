#!/usr/bin/perl
use Time::ParseDate;
use Time::CTime;
 $date="@ARGV";
#print "$date\n"; 
#it take the date in the mm-dd-yyy
#my $nd = 7;

my $ti = parsedate($date);

# add $numdays worth of seconds
 $nw = $ti + (1 * 24 * 60 * 60);
$nd = strftime("%d-%m-%Y",localtime($nw));


$nt = $ti + (7 * 24 * 60 * 60);
$td = strftime("%d-%m-%Y",localtime($nt));

print "From $nd To $td\n";

open FL,'<',"/media/panda/kubera-logs/kubera.$nd.log";
#open FH,'<','kubera.10-05-2015.log';
while (<FL>)
{
if ($_ =~ m#KotakDashboardMailerJob\] Finished mailer\. ([0-9]+) successes# )
{
#print $_;
$tot=$1;
print "Total mail sent on $nd is $1\n";
#print "total is $tatal\t";
#$er{"$1"}+=1;
}
}




#my $newdate = strftime("%d-%m-%Y",localtime($newtime));

#print "$newdate\n";

#$a=$newdate;
#b=$2
$i=0;
foreach my $j (1..7) {
$numdays=$j;
 $time = parsedate($date);
 #print "$time\n";
 $newtime = $time + ($numdays * 24 * 60 * 60);
#$nt = $time + (7 * 24 * 60 * 60);
#$nt = strftime("%d-%m-%Y",localtime($nt));

 $newdate = strftime("%d-%m-%Y",localtime($newtime));
#print "$newdate\t$nt\n"; 
#chdir(/media/panda/kotakmoneywatch-logs);
open FH,'<',"/media/panda/kotakmoneywatch-logs/ssl_access.$newdate.log";
while (<FH>)
{
if ($_ =~ m#/images\/mailers\/callMe\.png\?s\=Weekly\-Dashboard\-([a-z]+)\-([0-9]+)\-([0-9\-]+)# )
{
if ($ee{"$2"} == "") 
{
$ee{"$2"}=1;
$er{"$1"}+=1;
}
}



if ($_ =~ m#GET \/KuberaVault\/kotak\/login\?s\=Weekly\-Dashboard\-([a-z]+)\-([0-9]+)\-([0-9\-]+)# )
{
$err{"$1"}+=1;

#$er{"$2\t$3\t$1"}+=1;



$i++;
}

}
}
foreach $y (sort keys %er)         # Print name 5 times
 { 
print "$y\t\t$er{$y}\n";
print "percetage of user opened over total mail sent is  ", ($er{$y}/$tot) * 100,"\n";
print "Percentage of act over opened mail is ", ($i/$er{$y}) * 100 ,"\n";
print "Percentage of act over total mail sent mail is ",($i/$tot) * 100 ,"\n";


}

#$sum=$sum+$i;
#print " percetage of user opened over total mail sent is $r
#%er="";
print "Total act is  $i \n";

#}
foreach $t (sort keys %err)         # Print name 5 times
 { 
print "$t\t\t$err{$t}\n";
}
#print "The total number of user is  $j \n";
#$sum=$sum+$j;


#print "Total number of user for entire week $sum\n"
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


