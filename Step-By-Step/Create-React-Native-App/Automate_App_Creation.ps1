function SafetyCheck {
#Checking the required folder and directories for app creation
. $PSScriptRoot\CheckFoldersAndDirectories.ps1

#Checking Dependencies
. $PSScriptRoot\CheckDependencies.ps1
}

#Executing Function
SafetyCheck

#Creating a React Native Application
function CreateProjectDetails {

#Creating React Native Applciation With Expo 
. $PSScriptRoot\CreateReactNativeApp.ps1

}

#Executing Function
CreateProjectDetails