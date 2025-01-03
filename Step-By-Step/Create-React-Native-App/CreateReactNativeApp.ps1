$LoggedInUser = $env:username
$DefaultPathPrefix = "C:\Users\$($LoggedinUser)"

#Creating React Native Application
function CreateReactNativeApp {
Set-Location -Path "$($DefaultPathPrefix)\Documents\mast-projects" 
Start-Process cmd.exe -NoNewWindow -ArgumentList " /c npx create-expo-app -t expo-template-blank-typescript" -Wait
}

#Executing Function
CreateReactNativeApp