$logday =1;
$creationDate = (Get-Date).AddDays($logday);
$sorce1 = "C:\Users\gahyek\Desktop\Kimgahye 개인폴더\CF\test01\";
$fordernamepattern = @("HSS.*","*.HSK","*.HSM","*.HSU","*.trc")
#$sorce2 = "C:\Users\gahyek\Desktop\Kimgahye 개인폴더\CF\test01\HSS\";
#$arrPath = @($sorce1,$sorce2);

$blnRecurse = $ture;
Get-ChildItem -path $sorce1 -Exclude $fordernamepattern -Recurse:$blnRecurse | where-Object { $_.LastWritetime -lt $creationDate } |  Remove-Item  -force
