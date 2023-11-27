# Set this file in C:\Users\$USER\.config\powershell
# Add in: $PROFILE.CurrentUserCurrentHost
#   . $env:USERPROFILE\.config\powershell\user_profile.ps1

# Prompt
# oh-my-posh init pwsh --config "$(scoop prefix oh-my-posh)\themes\atomic.omp.json" | Invoke-Expression
# Import-Module posh-git
Invoke-Expression (&starship init powershell)

# PSReadline
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Paths
$env:Path += ";C:\Users\cyrbr\scoop\apps\7zip\current\"

# Icons
Import-Module -Name Terminal-Icons

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Utilities
function which ($command){
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function get-gitstatus(){
  git status 
}


function Add-ToPath($NewFolderPath, $ForCurrentUser = $false) {
    $envScope = if ($ForCurrentUser) { "User" } else { "Machine" }

    # Get the current PATH
    $currentPath = [Environment]::GetEnvironmentVariable("PATH", $envScope)

    # Check if the path already exists
    if ($currentPath -split ";" -contains $NewFolderPath) {
        Write-Host "Path $NewFolderPath is already in PATH."
    } else {
        # Append the new folder path to the current PATH
        $newPath = $currentPath + ";" + $NewFolderPath

        # Set the new PATH
        [Environment]::SetEnvironmentVariable("PATH", $newPath, $envScope)

        Write-Host "Path $NewFolderPath added to PATH for $envScope."
    }
}

function GoTo-TempDirectory {
  cd "C:\Users\$env:USERNAME\AppData\Local\Temp"
}

# Alias
# Set-Alias vim nvim
Set-Alias ll ls
Set-Alias grep findstr
Set-Alias c clear
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias -Name gst -Value get-gitstatus
New-Alias  -Name gotmp -Value GoTo-TempDirectory
