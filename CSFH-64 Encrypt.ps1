function CSFH-64Encrypt{
param(
[Parameter(Mandatory=$true)][string]$Filepath
)
$x=0
[System.Collections.ArrayList]$finalbyte=@()
$user=whoami
$string=(gwmi win32_account | Where-Object{$_.caption -eq "$user"}| select SID).SID
$BinArray=""
$ASstring=""
$ASstring=[int[]][char[]]"$string"
foreach($number in $ASstring){
$BinArray+=[convert]::Tostring($number,2) -join ""}
 $count=$BinArray.Length
 $countbin=[convert]::ToString($count,2)
 $paddingvalue=0
 $extravalue=64-$countbin.Length
 $addedvalue=""
 while($addedvalue.Length -lt $extravalue){
 $addedvalue+=0
 }
 $finish=$addedvalue + $countbin
 $BinArray=$BinArray + "1"
 while($BinArray.Length -lt "512"){
 $BinArray=$BinArray + 0
 }
 $BinArray=$BinArray + $finish
 $binlength=$BinArray.Length
 $byte=$BinArray[0..63]
 $endvalue=$BinArray.Length - 64
 $byte2=$BinArray[$endvalue..$binlength]
 do{
foreach($bit in $byte){
$bit2=$byte2[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$finalbyte+=$result
$x++}}while($x -le 63)
$combinedfinalbyte=$finalbyte -join""
$F32CFB=$combinedfinalbyte[0..31]
$L32CFB=$combinedfinalbyte[32..63]
$F32CFBR=$combinedfinalbyte[0..31]
$L32CFBR=$combinedfinalbyte[32..63]
[array]::Reverse($F32CFBR)
[array]::Reverse($L32CFBR)
[System.Collections.ArrayList]$CombinedBytesReveresed=@()
$x=0
do{
foreach($bit in $F32CFBR){
$bit2=$L32CFBR[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$CombinedBytesReveresed+=$result
$x++}}while($x -le 31)
$bit=""
$bit2=""
$x=0
[System.Collections.ArrayList]$CombinedBytes=@()
do{
foreach($bit in $F32CFB){
$bit2=$L32CFB[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bor $bit2
$CombinedBytes+=$result
$x++}}while($x -le 31)

[System.Collections.ArrayList]$Finalbinary=@()
$x=0
do{
foreach($bit in $CombinedBytes){
$bit2=$CombinedBytesReveresed[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bor $bit2
$Finalbinary+=$result
$x++}}while($x -le 31)
$Finalbinaryjoined=$Finalbinary-join""
$Finalbinaryjoined=[convert]::ToInt64($Finalbinaryjoined,2)
$Finalbinaryjoined=[convert]::ToString($Finalbinaryjoined,16)
#-----------------------Operation Separation Line-----------------------#
$x=0
[System.Collections.ArrayList]$finalbyte=@()
$BinArray=""
$ASstring=""
$ASstring=[int[]][char[]]"$string"
foreach($number in $ASstring){
$BinArray+=[convert]::Tostring($number,2) -join ""}
 $count=$BinArray.Length
 $countbin=[convert]::ToString($count,2)
 $paddingvalue=0
 $extravalue=64-$countbin.Length
 $addedvalue=""
 while($addedvalue.Length -lt $extravalue){
 $addedvalue+=0
 }
 $finish=$addedvalue + $countbin
 $BinArray=$BinArray + "1"
 while($BinArray.Length -lt "512"){
 $BinArray=$BinArray + 0
 }
 $BinArray=$BinArray + $finish
 $binlength=$BinArray.Length
 $byte=$BinArray[0..63]
 $endvalue=$BinArray.Length - 64
 $byte2=$BinArray[$endvalue..$binlength]
 do{
foreach($bit in $byte){
$bit2=$byte2[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bor $bit2
$finalbyte+=$result
$x++}}while($x -le 63)
$combinedfinalbyte=$finalbyte -join""
$F32CFB=$combinedfinalbyte[0..31]
$L32CFB=$combinedfinalbyte[32..63]
$F32CFBR=$combinedfinalbyte[0..31]
$L32CFBR=$combinedfinalbyte[32..63]
[array]::Reverse($F32CFBR)
[array]::Reverse($L32CFBR)
[System.Collections.ArrayList]$CombinedBytesReveresed=@()
$x=0
do{
foreach($bit in $F32CFBR){
$bit2=$L32CFBR[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bor $bit2
$CombinedBytesReveresed+=$result
$x++}}while($x -le 31)
$bit=""
$bit2=""
$x=0
[System.Collections.ArrayList]$CombinedBytes=@()
do{
foreach($bit in $F32CFB){
$bit2=$L32CFB[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$CombinedBytes+=$result
$x++}}while($x -le 31)

[System.Collections.ArrayList]$Finalbinary=@()
$x=0
do{
foreach($bit in $CombinedBytesReveresed){
$bit2=$CombinedBytes[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$Finalbinary+=$result
$x++}}while($x -le 31)
$Finalbinaryjoined2=$Finalbinary-join""
$Finalbinaryjoined2=[convert]::ToInt64($Finalbinaryjoined2,2)
$Finalbinaryjoined2=[convert]::ToString($Finalbinaryjoined2,16)
#-----------------------Operation Separation Line-----------------------#
$x=0
[System.Collections.ArrayList]$finalbyte=@()
$BinArray=""
$ASstring=""
$ASstring=[int[]][char[]]"$string"
foreach($number in $ASstring){
$BinArray+=[convert]::Tostring($number,2) -join ""}
 $count=$BinArray.Length
 $countbin=[convert]::ToString($count,2)
 $paddingvalue=0
 $extravalue=64-$countbin.Length
 $addedvalue=""
 while($addedvalue.Length -lt $extravalue){
 $addedvalue+=0
 }
 $finish=$addedvalue + $countbin
 $BinArray=$BinArray + "1"
 while($BinArray.Length -lt "512"){
 $BinArray=$BinArray + 0
 }
 $BinArray=$BinArray + $finish
 $binlength=$BinArray.Length
 $byte=$BinArray[0..63]
 $endvalue=$BinArray.Length - 64
 $byte2=$BinArray[$endvalue..$binlength]
 do{
foreach($bit in $byte){
$bit2=$byte2[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$finalbyte+=$result
$x++}}while($x -le 63)
$combinedfinalbyte=$finalbyte -join""
$F32CFB=$combinedfinalbyte[0..31]
$L32CFB=$combinedfinalbyte[32..63]
$F32CFBR=$combinedfinalbyte[0..31]
$L32CFBR=$combinedfinalbyte[32..63]
[array]::Reverse($F32CFBR)
[array]::Reverse($L32CFBR)
[System.Collections.ArrayList]$CombinedBytesReveresed=@()
$x=0
do{
foreach($bit in $F32CFBR){
$bit2=$L32CFBR[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$CombinedBytesReveresed+=$result
$x++}}while($x -le 31)
$bit=""
$bit2=""
$x=0
[System.Collections.ArrayList]$CombinedBytes=@()
do{
foreach($bit in $F32CFB){
$bit2=$L32CFB[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$CombinedBytes+=$result
$x++}}while($x -le 31)

[System.Collections.ArrayList]$Finalbinary=@()
$x=0
do{
foreach($bit in $CombinedBytesReveresed){
$bit2=$CombinedBytes[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bor $bit2
$Finalbinary+=$result
$x++}}while($x -le 31)
$Finalbinaryjoined3=$Finalbinary-join""
$Finalbinaryjoined3=[convert]::ToInt64($Finalbinaryjoined3,2)
$Finalbinaryjoined3=[convert]::ToString($Finalbinaryjoined3,16)
#-----------------------Operation Separation Line-----------------------#
$x=0
[System.Collections.ArrayList]$finalbyte=@()
$BinArray=""
$ASstring=""
$ASstring=[int[]][char[]]"$string"
foreach($number in $ASstring){
$BinArray+=[convert]::Tostring($number,2) -join ""}
 $count=$BinArray.Length
 $countbin=[convert]::ToString($count,2)
 $paddingvalue=0
 $extravalue=64-$countbin.Length
 $addedvalue=""
 while($addedvalue.Length -lt $extravalue){
 $addedvalue+=0
 }
 $finish=$addedvalue + $countbin
 $BinArray=$BinArray + "1"
 while($BinArray.Length -lt "512"){
 $BinArray=$BinArray + 0
 }
 $BinArray=$BinArray + $finish
 $binlength=$BinArray.Length
 $byte=$BinArray[0..63]
 $endvalue=$BinArray.Length - 64
 $byte2=$BinArray[$endvalue..$binlength]
 do{
foreach($bit in $byte){
$bit2=$byte2[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$finalbyte+=$result
$x++}}while($x -le 63)
$combinedfinalbyte=$finalbyte -join""
$F32CFB=$combinedfinalbyte[0..31]
$L32CFB=$combinedfinalbyte[32..63]
$F32CFBR=$combinedfinalbyte[0..31]
$L32CFBR=$combinedfinalbyte[32..63]
[array]::Reverse($F32CFBR)
[array]::Reverse($L32CFBR)
[System.Collections.ArrayList]$CombinedBytesReveresed=@()
$x=0
do{
foreach($bit in $F32CFBR){
$bit2=$L32CFBR[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bor $bit2
$CombinedBytesReveresed+=$result
$x++}}while($x -le 31)
$bit=""
$bit2=""
$x=0
[System.Collections.ArrayList]$CombinedBytes=@()
do{
foreach($bit in $F32CFB){
$bit2=$L32CFB[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$CombinedBytes+=$result
$x++}}while($x -le 31)

[System.Collections.ArrayList]$Finalbinary=@()
$x=0
do{
foreach($bit in $CombinedBytesReveresed){
$bit2=$CombinedBytes[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$Finalbinary+=$result
$x++}}while($x -le 31)
$Finalbinaryjoined4=$Finalbinary-join""
$Finalbinaryjoined4=[convert]::ToInt64($Finalbinaryjoined4,2)
$Finalbinaryjoined4=[convert]::ToString($Finalbinaryjoined4,16)
#-----------------------Operation Separation Line-----------------------#
$x=0
[System.Collections.ArrayList]$finalbyte=@()
$BinArray=""
$ASstring=""
$ASstring=[int[]][char[]]"$string"
foreach($number in $ASstring){
$BinArray+=[convert]::Tostring($number,2) -join ""}
 $count=$BinArray.Length
 $countbin=[convert]::ToString($count,2)
 $paddingvalue=0
 $extravalue=64-$countbin.Length
 $addedvalue=""
 while($addedvalue.Length -lt $extravalue){
 $addedvalue+=0
 }
 $finish=$addedvalue + $countbin
 $BinArray=$BinArray + "1"
 while($BinArray.Length -lt "512"){
 $BinArray=$BinArray + 0
 }
 $BinArray=$BinArray + $finish
 $binlength=$BinArray.Length
 $byte=$BinArray[0..63]
 $endvalue=$BinArray.Length - 64
 $byte2=$BinArray[$endvalue..$binlength]
 do{
foreach($bit in $byte){
$bit2=$byte2[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$finalbyte+=$result
$x++}}while($x -le 63)
$combinedfinalbyte=$finalbyte -join""
$F32CFB=$combinedfinalbyte[0..31]
$L32CFB=$combinedfinalbyte[32..63]
$F32CFBR=$combinedfinalbyte[0..31]
$L32CFBR=$combinedfinalbyte[32..63]
[array]::Reverse($F32CFBR)
[array]::Reverse($L32CFBR)
[System.Collections.ArrayList]$CombinedBytesReveresed=@()
$x=0
do{
foreach($bit in $F32CFBR){
$bit2=$L32CFBR[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -band $bit2
$CombinedBytesReveresed+=$result
$x++}}while($x -le 31)
$bit=""
$bit2=""
$x=0
[System.Collections.ArrayList]$CombinedBytes=@()
do{
foreach($bit in $F32CFB){
$bit2=$L32CFB[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bor $bit2
$CombinedBytes+=$result
$x++}}while($x -le 31)

[System.Collections.ArrayList]$Finalbinary=@()
$x=0
do{
foreach($bit in $CombinedBytesReveresed){
$bit2=$CombinedBytes[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$Finalbinary+=$result
$x++}}while($x -le 31)
$Finalbinaryjoined5=$Finalbinary-join""
$Finalbinaryjoined5=[convert]::ToInt64($Finalbinaryjoined5,2)
$Finalbinaryjoined5=[convert]::ToString($Finalbinaryjoined5,16)
#-----------------------Operation Separation Line-----------------------#
$x=0
[System.Collections.ArrayList]$finalbyte=@()
$BinArray=""
$ASstring=""
$ASstring=[int[]][char[]]"$string"
foreach($number in $ASstring){
$BinArray+=[convert]::Tostring($number,2) -join ""}
 $count=$BinArray.Length
 $countbin=[convert]::ToString($count,2)
 $paddingvalue=0
 $extravalue=64-$countbin.Length
 $addedvalue=""
 while($addedvalue.Length -lt $extravalue){
 $addedvalue+=0
 }
 $finish=$addedvalue + $countbin
 $BinArray=$BinArray + "1"
 while($BinArray.Length -lt "512"){
 $BinArray=$BinArray + 0
 }
 $BinArray=$BinArray + $finish
 $binlength=$BinArray.Length
 $byte=$BinArray[0..63]
 $endvalue=$BinArray.Length - 64
 $byte2=$BinArray[$endvalue..$binlength]
 do{
foreach($bit in $byte){
$bit2=$byte2[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$finalbyte+=$result
$x++}}while($x -le 63)
$combinedfinalbyte=$finalbyte -join""
$F32CFB=$combinedfinalbyte[0..31]
$L32CFB=$combinedfinalbyte[32..63]
$F32CFBR=$combinedfinalbyte[0..31]
$L32CFBR=$combinedfinalbyte[32..63]
[array]::Reverse($F32CFBR)
[array]::Reverse($L32CFBR)
[System.Collections.ArrayList]$CombinedBytesReveresed=@()
$x=0
do{
foreach($bit in $F32CFBR){
$bit2=$L32CFBR[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$CombinedBytesReveresed+=$result
$x++}}while($x -le 31)
$bit=""
$bit2=""
$x=0
[System.Collections.ArrayList]$CombinedBytes=@()
do{
foreach($bit in $F32CFB){
$bit2=$L32CFB[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$CombinedBytes+=$result
$x++}}while($x -le 31)

[System.Collections.ArrayList]$Finalbinary=@()
$x=0
do{
foreach($bit in $CombinedBytesReveresed){
$bit2=$CombinedBytes[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$Finalbinary+=$result
$x++}}while($x -le 31)
$Finalbinaryjoined6=$Finalbinary-join""
$Finalbinaryjoined6=[convert]::ToInt64($Finalbinaryjoined6,2)
$Finalbinaryjoined6=[convert]::ToString($Finalbinaryjoined6,16)
#-----------------------Operation Separation Line-----------------------#
$x=0
[System.Collections.ArrayList]$finalbyte=@()
$BinArray=""
$ASstring=""
$ASstring=[int[]][char[]]"$string"
foreach($number in $ASstring){
$BinArray+=[convert]::Tostring($number,2) -join ""}
 $count=$BinArray.Length
 $countbin=[convert]::ToString($count,2)
 $paddingvalue=0
 $extravalue=64-$countbin.Length
 $addedvalue=""
 while($addedvalue.Length -lt $extravalue){
 $addedvalue+=0
 }
 $finish=$addedvalue + $countbin
 $BinArray=$BinArray + "1"
 while($BinArray.Length -lt "512"){
 $BinArray=$BinArray + 0
 }
 $BinArray=$BinArray + $finish
 $binlength=$BinArray.Length
 $byte=$BinArray[0..63]
 $endvalue=$BinArray.Length - 64
 $byte2=$BinArray[$endvalue..$binlength]
 do{
foreach($bit in $byte){
$bit2=$byte2[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bor $bit2
$finalbyte+=$result
$x++}}while($x -le 63)
$combinedfinalbyte=$finalbyte -join""
$F32CFB=$combinedfinalbyte[0..31]
$L32CFB=$combinedfinalbyte[32..63]
$F32CFBR=$combinedfinalbyte[0..31]
$L32CFBR=$combinedfinalbyte[32..63]
[array]::Reverse($F32CFBR)
[array]::Reverse($L32CFBR)
[System.Collections.ArrayList]$CombinedBytesReveresed=@()
$x=0
do{
foreach($bit in $F32CFBR){
$bit2=$L32CFBR[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bor $bit2
$CombinedBytesReveresed+=$result
$x++}}while($x -le 31)
$bit=""
$bit2=""
$x=0
[System.Collections.ArrayList]$CombinedBytes=@()
do{
foreach($bit in $F32CFB){
$bit2=$L32CFB[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bor $bit2
$CombinedBytes+=$result
$x++}}while($x -le 31)

[System.Collections.ArrayList]$Finalbinary=@()
$x=0
do{
foreach($bit in $CombinedBytesReveresed){
$bit2=$CombinedBytes[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bor $bit2
$Finalbinary+=$result
$x++}}while($x -le 31)
$Finalbinaryjoined7=$Finalbinary-join""
$Finalbinaryjoined7=[convert]::ToInt64($Finalbinaryjoined7,2)
$Finalbinaryjoined7=[convert]::ToString($Finalbinaryjoined7,16)
#-----------------------Operation Separation Line-----------------------#
$x=0
[System.Collections.ArrayList]$finalbyte=@()
$BinArray=""
$ASstring=""
$ASstring=[int[]][char[]]"$string"
foreach($number in $ASstring){
$BinArray+=[convert]::Tostring($number,2) -join ""}
 $count=$BinArray.Length
 $countbin=[convert]::ToString($count,2)
 $paddingvalue=0
 $extravalue=64-$countbin.Length
 $addedvalue=""
 while($addedvalue.Length -lt $extravalue){
 $addedvalue+=0
 }
 $finish=$addedvalue + $countbin
 $BinArray=$BinArray + "1"
 while($BinArray.Length -lt "512"){
 $BinArray=$BinArray + 0
 }
 $BinArray=$BinArray + $finish
 $binlength=$BinArray.Length
 $byte=$BinArray[0..63]
 $endvalue=$BinArray.Length - 64
 $byte2=$BinArray[$endvalue..$binlength]
 do{
foreach($bit in $byte){
$bit2=$byte2[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$finalbyte+=$result
$x++}}while($x -le 63)
$combinedfinalbyte=$finalbyte -join""
$F32CFB=$combinedfinalbyte[0..31]
$L32CFB=$combinedfinalbyte[32..63]
$F32CFBR=$combinedfinalbyte[0..31]
$L32CFBR=$combinedfinalbyte[32..63]
[array]::Reverse($F32CFBR)
[array]::Reverse($L32CFBR)
[System.Collections.ArrayList]$CombinedBytesReveresed=@()
$x=0
do{
foreach($bit in $F32CFBR){
$bit2=$L32CFBR[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -band $bit2
$CombinedBytesReveresed+=$result
$x++}}while($x -le 31)
$bit=""
$bit2=""
$x=0
[System.Collections.ArrayList]$CombinedBytes=@()
do{
foreach($bit in $F32CFB){
$bit2=$L32CFB[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bxor $bit2
$CombinedBytes+=$result
$x++}}while($x -le 31)

[System.Collections.ArrayList]$Finalbinary=@()
$x=0
do{
foreach($bit in $CombinedBytesReveresed){
$bit2=$CombinedBytes[$x]
$bit2=[convert]::ToInt64($bit2,2)
$bit=[convert]::ToInt64($bit,2)
$result=$bit -bor $bit2
$Finalbinary+=$result
$x++}}while($x -le 31)
$Finalbinaryjoined8=$Finalbinary-join""
$Finalbinaryjoined8=[convert]::ToInt64($Finalbinaryjoined8,2)
$Finalbinaryjoined8=[convert]::ToString($Finalbinaryjoined8,16)
$64Hash=$Finalbinaryjoined + $Finalbinaryjoined2 + $Finalbinaryjoined3 + $Finalbinaryjoined4 + $Finalbinaryjoined5 + $Finalbinaryjoined6 + $Finalbinaryjoined7 + $Finalbinaryjoined8


$byte=Get-Content -Path $Filepath -Encoding Byte
$directory=(gci -Path $Filepath | select fullname).fullname

$Filepath2=gci -Path $directory
$Zip=$Filepath2.fullname
$ZipE=".zip"
$Zip=$Zip.Split(".")
$Dest=$Zip[0],$ZipE -join ""

#Create new folder for zipping
New-Item -Path C:\Users\$env:username\Desktop -Name ZipfileFolder -ItemType directory
Move-Item -Path $Filepath -Destination C:\Users\$env:username\Desktop\ZipfileFolder
$zipfilelocation="C:\Users\$env:username\Desktop\ZipfileFolder"

[Reflection.Assembly]::LoadWithPartialName( "System.IO.Compression.FileSystem" )
[System.IO.Compression.ZipFile]::CreateFromDirectory($zipfilelocation,$Dest)
[System.Collections.ArrayList]$combinedarray=@()
$key1=7
$key2=17
$key3=24
foreach($bit in $byte){
$value=$bit+$key1
$value=$value*($key2-$key1)
$value=$value-$key3
$combinedarray+=$value
}
$combinedarray+="`n$64Hash"
$combinedarray | Out-File -FilePath $Dest
}
