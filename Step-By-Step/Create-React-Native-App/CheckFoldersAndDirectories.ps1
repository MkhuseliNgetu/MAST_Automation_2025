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