#Checking if the Node, React & Expo are installed
function CheckRequiredDependencies {

$NodeStatus = Start-Process cmd.exe -NoNewWindow -ArgumentList '/c node -v' -RedirectStandardOutput '.\DepsStatus.txt' -RedirectStandardError '.\DepsErrorStatus.txt' -Wait
$ReactStatus = Start-Process cmd.exe -NoNewWindow -ArgumentList '/c npm view react version' -RedirectStandardOutput '.\DepsStatus.txt' -RedirectStandardError '.\DepsErrorStatus.txt' -Wait
$NodePackageManagerStatus = Start-Process cmd.exe -NoNewWindow -ArgumentList '/c npm -v' -RedirectStandardOutput '.\DepsStatus.txt' -RedirectStandardError '.\DepsErrorStatus.txt' -Wait
$ExpoStatus = Start-Process cmd.exe -NoNewWindow -ArgumentList '/c npx expo --version' -RedirectStandardOutput '.\DepsStatus.txt' -RedirectStandardError '.\DepsErrorStatus.txt' -Wait

([System.String]::IsNullOrEmpty($NodeStatus) && [System.String]::IsNullOrEmpty($ReactStatus) &&
 [System.String]::IsNullOrEmpty($NodePackageManagerStatus) && [System.String]::IsNullOrEmpty($ExpoStatus)) ? 
 (Write-Output 'Dependencies are installed !') : (Write-Output 'Dependencies are missing') 

}

#Executing Function
CheckRequiredDependencies