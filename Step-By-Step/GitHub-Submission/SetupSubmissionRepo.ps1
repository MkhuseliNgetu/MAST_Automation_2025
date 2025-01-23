[System.String]$LoggedInUser = $env:username
[System.Int32] $StudentNumber
[System.String] $FullName
[System.String] $GitHubSubmissionLink
[System.String] $DefaultSubmissionPath = "C:\Users\$($LoggedinUser)\Documents\mast-projects\"
[System.String] $SubmissionFolder
[System.String[]] $AssessmentType = @("Assignment", "POE_Part_1", "POE_Part_2", "POE_Part_3", "POE_Part_1_Resubmission","POE_Part_2_Resubmission","POE_Part_3_Resubmission")
[System.Int32] $AssessmentTypeSelection
[System.Int32] $MoveFilesSelection

$StudentNumber = Read-Host -Prompt "
Enter your student number (Only the numbers)"

$FullName = Read-Host -Prompt "
Please provide your name and surname([Name]_[Surname])"

$GitHubSubmissionLink = Read-Host -Prompt "
Please provide your GitHub submission link (.git)"

# First Major Prompt
$AssessmentTypeSelection = Read-Host -Prompt "
Please select the type of assessment you wish to submit

1-. Assignment
2-. POE Part 1
3-. POE Part 2
4-. POE Part 3
5-. (Resubmission) POE Part 1
6-. (Resubmission) POE Part 2
7-. (Resubmission) POE Part 3

Enter a option to proceed "

#Executing Function (in mandatory order)
GetSubmissionType

# Second Major Prompt
$MoveFilesSelection = Read-Host "

Would you like to automatically move your files into this submission folder?

1-. Yes

2-. No

Enter a option to proceed " 

#Executing Function
GetFilesIntoSubmissionFolder


function GetSubmissionType {

        switch ($AssessmentTypeSelection) {

        1 { $SubmissionFolder = "MAST5112_$($AssessmentType[0])_$($FullName)_ST$($StudentNumber)"
            New-Item -Path $DefaultSubmissionPath -Name $SubmissionFolder -ItemType Directory 
            $MergedSubmissionPath = -Join($DefaultSubmissionPath, $SubmissionFolder)
            Set-Location -Path $MergedSubmissionPath -PassThru
            Start-Process cmd.exe -NoNewWindow -ArgumentList " /c cd $($MergedSubmissionPath) & git init" -Wait };

        2 { $SubmissionFolder = "MAST5112_$($AssessmentType[1])_$($FullName)_ST$($StudentNumber)"
            New-Item -Path $DefaultSubmissionPath -Name $SubmissionFolder -ItemType Directory  
            $MergedSubmissionPath = -Join($DefaultSubmissionPath, $SubmissionFolder)
            Set-Location -Path $MergedSubmissionPath -PassThru
            Start-Process cmd.exe -NoNewWindow -ArgumentList " /c cd $($MergedSubmissionPath) & git init" -Wait };

        3 { $SubmissionFolder = "MAST5112_$($AssessmentType[2])_$($FullName)_ST$($StudentNumber)"
            New-Item -Path $DefaultSubmissionPath -Name $SubmissionFolder -ItemType Directory 
            $MergedSubmissionPath = -Join($DefaultSubmissionPath, $SubmissionFolder)
            Set-Location -Path $MergedSubmissionPath -PassThru
            Start-Process cmd.exe -NoNewWindow -ArgumentList " /c cd $($MergedSubmissionPath) & git init" -Wait };

        4 { $SubmissionFolder = "MAST5112_$($AssessmentType[3])_$($FullName)_ST$($StudentNumber)"
            New-Item -Path $DefaultSubmissionPath -Name $SubmissionFolder -ItemType Directory 
            $MergedSubmissionPath = -Join($DefaultSubmissionPath, $SubmissionFolder)
            Set-Location -Path $MergedSubmissionPath -PassThru
            Start-Process cmd.exe -NoNewWindow -ArgumentList " /c cd $($MergedSubmissionPath) & git init" -Wait };

        5 { $SubmissionFolder = "MAST5112_$($AssessmentType[4])_$($FullName)_ST$($StudentNumber)"
            New-Item -Path $DefaultSubmissionPath -Name $SubmissionFolder -ItemType Directory 
            $MergedSubmissionPath = -Join($DefaultSubmissionPath, $SubmissionFolder)
            Set-Location -Path $MergedSubmissionPath -PassThru
            Start-Process cmd.exe -NoNewWindow -ArgumentList " /c cd $($MergedSubmissionPath) & git init" -Wait };

        6 { $SubmissionFolder = "MAST5112_$($AssessmentType[5])_$($FullName)_ST$($StudentNumber)"
            New-Item -Path $DefaultSubmissionPath -Name $SubmissionFolder -ItemType Directory 
            $MergedSubmissionPath = -Join($DefaultSubmissionPath, $SubmissionFolder)
            Set-Location -Path $MergedSubmissionPath -PassThru
            Start-Process cmd.exe -NoNewWindow -ArgumentList " /c cd $($MergedSubmissionPath) & git init" -Wait };
            
        7 { $SubmissionFolder = "MAST5112_$($AssessmentType[6])_$($FullName)_ST$($StudentNumber)"
            New-Item -Path $DefaultSubmissionPath -Name $SubmissionFolder -ItemType Directory 
            $MergedSubmissionPath = -Join($DefaultSubmissionPath, $SubmissionFolder)
            Set-Location -Path $MergedSubmissionPath -PassThru
            Start-Process cmd.exe -NoNewWindow -ArgumentList " /c cd $($MergedSubmissionPath) & git init" -Wait };

        Default { $SubmissionFolder = "MAST5112_$($AssessmentType[0])_$($FullName)_ST$($StudentNumber)"
        New-Item -Path $DefaultSubmissionPath -Name $SubmissionFolder -ItemType Directory 
        $MergedSubmissionPath = -Join($DefaultSubmissionPath, $SubmissionFolder)
        Set-Location -Path $MergedSubmissionPath -PassThru
        Start-Process cmd.exe -NoNewWindow -ArgumentList " /c cd $($MergedSubmissionPath) & git init" -Wait };
    }
}

[System.String] $Node_ModulesFilter = ""
[System.Int32] $CommitAndPushQuery
function GetFilesIntoSubmissionFolder {
    
    if($MoveFilesSelection -eq 1) {
        Copy-Item -Path "C:\Users\mksan\Documents\syan-studios\syan-studios\*" -Destination $MergedSubmissionPath -Exclude $Node_ModulesFilter

        $CommitAndPushQuery = Read-Host "
        
        Would you like to finalise your submission (commit & push)?
        
        1-. Yes

        2-. No
        
        Enter a option to proceed "

        #Executing Function
        CommitAndPushSubmission

    }elseif($MoveFilesSelection -eq 2) {
       Read-Host "Program is shutting down...."
       Read-Host "Please remember to copy your file into the following folder, before submitting: $($MergedSubmissionPath)"
       Read-Host "Good Luck with your submission :)"
    }

}

[System.String] $SubmissionMessage = "Final Submission"
function CommitAndPushSubmission {

    if($CommitAndPushQuery -eq 1) {
        Start-Process cmd.exe -NoNewWindow -ArgumentList " /c git status & git add . --verbose" -Wait 
        Start-Process cmd.exe -NoNewWindow -ArgumentList " /c git status & git commit -m $($SubmissionMessage) & git remote add" -Wait 
        Start-Process cmd.exe -NoNewWindow -ArgumentList " /c git status & git push origin master" -Wait 
    }elseif($CommitAndPushQuery -eq 2) {
        Read-Host "Program is shutting down...."
        Read-Host "Please remember to commit and push your submission to GitHub"
        Read-Host "Good Luck with your submission :)"
    }
}