$LoggedInUser = $env:username
$DefaultPathPrefix = "C:\Users\$($LoggedinUser)"

function CheckRequiredFoldersAndDirectories {

#Checking if User Directory Exists project folder exists
(Test-Path -Path $DefaultPathPrefix) ? (Write-Output 'Directory Exists') : (Write-Output 'Directory Not Found. Please supply a valid username')

#Checking if the folder exists in the desired directory
(Test-Path -Path "$($DefaultPathPrefix)\Documents\mast-projects" ) ? (Write-Output 'MAST Folder Exists ! Creating New App....') : (New-Item -Path "$($DefaultPathPrefix)\Documents\mast-projects" -ItemType Directory)

}
#Executing Function
CheckRequiredFoldersAndDirectories

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

#Creating React Native Application
function CreateReactNativeApp {

Set-Location -Path "$($DefaultPathPrefix)\Documents\mast-projects" 
Start-Process cmd.exe -NoNewWindow -ArgumentList " /c npx create-expo-app -t expo-template-blank-typescript" -Wait

}
#Executing Function
CreateReactNativeApp