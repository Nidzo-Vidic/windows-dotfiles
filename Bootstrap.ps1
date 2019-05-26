Set-ExecutionPolicy RemoteSigned

Set-NetConnectionProfile -NetworkCategory Private

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco.exe install conemu -y
choco.exe install git -y
choco.exe install googlechrome -y
choco.exe install obs-studio
choco.exe install vscode -y

# ######################
# ## Install posh git ##
# ######################
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force

# ########################
# ## Install oh-my-posh ##
# ########################
Install-Module oh-my-posh -Scope CurrentUser

# ################################
# ## Install VS Code Extensions ##
# ################################
$extensions =
"eamodio.gitlens",
"ms-vscode.csharp",
"ms-vscode.powershell",
"ms-vsliveshare.vsliveshare",
"PKief.material-icon-theme",
"ritwickdey.LiveServer",
"shd101wyy.markdown-preview-enhanced",
"sidneys1.gitconfig",
"Tyriar.sort-lines",
"VisualStudioExptTeam.vscodeintellicode",
"yycalm.linecount",
"zhuangtongfa.Material-theme"

for ($i = 0; $i -lt $extensions.Count; $i++) {
    code --install-extension $extensions[$i]
}

###########################
## Create symbolik links ##
###########################

# PowerShell
New-Item -Force -ItemType SymbolicLink $HOME\Documents\ -Name WindowsPowerShell $HOME\dev\WindowsPowerShell

# Visual Studio Code settings.json
New-Item -Force -ItemType SymbolicLink $HOME\AppData\Roaming\Code\User\ -Name settings.json -Value $HOME\dev\windows-dotfiles\vscode\settings.json

# Visual Studio Code keybindings
New-Item -Force -ItemType SymbolicLink $HOME\AppData\Roaming\Code\User\ -Name keybindings.json -Value $HOME\dev\windows-dotfiles\vscode\keybindings.json

# .gitconfig
New-Item -Force -ItemType SymbolicLink $HOME\ -Name .gitconfig -Value $HOME\dev\windows-dotfiles\git\.gitconfig

# ConEmu Settings
New-Item -Force -ItemType SymbolicLink $HOME\AppData\Roaming -Name ConEmu.xml -Value $HOME\dev\windows-dotfiles\ConEmu\ConEmu.xml

