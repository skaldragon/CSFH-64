function CSFH-64Decrypt{
param(
[Parameter(Mandatory=$true)][string]$Filepath,
#Used when you are the only person able to decrypt your file
[Parameter(Mandatory=$false)][switch]$privatefile
)
$x=0
[System.Collections.ArrayList]$finalbyte=@()
$string=[System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value
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


Write-host "OPEN KEY.TXT FILE FOR THIS FILE TO DECRYPT" -ForegroundColor RED
Sleep -Seconds 3
Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }
$null = $FileBrowser.ShowDialog()
$keyresult=Get-content $FileBrowser.FileName
$key=$keyresult



if($privatefile){
$Stream="Verification"
$Verification=Get-Content -Stream $Stream -Path $FileBrowser.FileName
if($Verification -eq $64Hash){
Write-Host "Where do you want your file to go? Include File and Extension" -ForegroundColor Red
Sleep -s 3
$SavedFile = New-Object System.Windows.Forms.SaveFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }
$null = $SavedFile.ShowDialog()
$File = Get-Item -Path $Filepath -ErrorAction SilentlyContinue
$cipherBytes = [System.IO.File]::ReadAllBytes($File.FullName)
$outPath = $SavedFile.FileName
$aes = New-Object System.Security.Cryptography.AesManaged
$aes.Mode = [System.Security.Cryptography.CipherMode]::CBC
$aes.Padding = [System.Security.Cryptography.PaddingMode]::Zeros
$aes.BlockSize = 128
$aes.KeySize = 256
$aes.Key = $key
$aes.IV = $cipherBytes[0..15]
$decryptor = $aes.CreateDecryptor()
$decryptedBytes = $decryptor.TransformFinalBlock($cipherBytes, 16, $cipherBytes.Length - 16)
$aes.Dispose()
[System.IO.File]::WriteAllBytes($outPath, $decryptedBytes)
Remove-Item -Path $Filepath -Force
Remove-Item -Path $FileBrowser.FileName -Force

}
}

elseif(!$privatefile){
$exists=(Get-Item -Path $FileBrowser.FileName -Stream Verification).Stream
$Verification=Get-Content -Stream $Stream -Path $FileBrowser.FileName -ErrorAction SilentlyContinue
if($Verification -ne $64Hash){
Write-Host "You are not able to decrypt this file" -ForegroundColor Red
if($exists){
Write-Host "You are not able to decrypt this file" -ForegroundColor Red
}
}
else{
Write-Host "Where do you want your file to go? Include File and Extension" -ForegroundColor Red
Sleep -s 3
$SavedFile = New-Object System.Windows.Forms.SaveFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }
$null = $SavedFile.ShowDialog()
$File = Get-Item -Path $Filepath -ErrorAction SilentlyContinue
$cipherBytes = [System.IO.File]::ReadAllBytes($File.FullName)
$outPath = $SavedFile.FileName
$aes = New-Object System.Security.Cryptography.AesManaged
$aes.Mode = [System.Security.Cryptography.CipherMode]::CBC
$aes.Padding = [System.Security.Cryptography.PaddingMode]::Zeros
$aes.BlockSize = 128
$aes.KeySize = 256
$aes.Key = $key
$aes.IV = $cipherBytes[0..15]
$decryptor = $aes.CreateDecryptor()
$decryptedBytes = $decryptor.TransformFinalBlock($cipherBytes, 16, $cipherBytes.Length - 16)
$aes.Dispose()
[System.IO.File]::WriteAllBytes($outPath, $decryptedBytes)
Remove-Item -Path $Filepath -Force
Remove-Item -Path $FileBrowser.FileName -Force
}
}


else{
Write-Host "You are not able to decrypt this file" -ForegroundColor Red
}
}
