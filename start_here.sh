
# install brew bundle
brew bundle

# install oh my zshell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "install nvm"
# setup nvm
nvm ls-remote | tail

# Install it (it should use it & set as default automatically)
nvm install

# Make sure
nvm list
nvm current

# setup shell visuals and activate
npm i -g spaceship-prompt

# For docker
# brew install colima
# brew install docker docker-compose
mkdir -p ~/.docker/cli-plugins
ln -sfn $(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose

# Setup git identity
git config --global user.name "Ondrej Slama"
git config --global user.email "ondrej.slama@veeam.com"

# Setup vs-code as git editor (commit messages, rebase, etc.)
git config --global core.editor "code --wait"

# Close any open System Preferences panes, to prevent them from overriding settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop/Screenshots"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# take screenshots as jpg (usually smaller size) and not png
defaults write com.apple.screencapture type jpg

# Default folder to $HOME
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder.
chflags nohidden ~/Library

# Show hidden files by default
defaults write com.apple.Finder AppleShowAllFiles -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network & USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Other
# ---

# Disable dashboard
defaults write com.apple.dashboard mcx-disabled -boolean true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"


# Sleep the display after 5 minutes
sudo pmset -a displaysleep 5

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent YES
killall SystemUIServer

# Customize dock
# ---

# Set the icon size of Dock items to 45 pixels
defaults write com.apple.dock tilesize -int 45

# Set the dock orientation to left
defaults write com.apple.dock orientation -string left

# Autohide Dock
defaults write com.apple.dock autohide -boolean true

# Minimalize effect scale
defaults write com.apple.dock mineffect -string scale

# Show indicators
defaults write com.apple.dock show-process-indicators -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

defaults write com.apple.dock persistent-apps -array
for app in \
  "/System/Library/CoreServices/Finder.app" \
  "/System/Applications/Calendar.app" \
  "/Applications/Google Chrome.app" \
  "/Applications/Slack.app" \
  "/Applications/iTerm.app" \
  "/Applications/Visual Studio Code.app" \
  "/System/Applications/System Preferences.app" \
  ; do
  if [ "$app" "==" "spacer" ]; then
    defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="small-spacer-tile";}'
  else
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
  fi
done

killall Dock

# set DNS servers
# networksetup -setdnsservers Wi-Fi 8.8.8.8 1.1.1.1

# install pip tools
pip3 install pip-tools

# New machine - new ssh key
# eval "$(ssh-agent -s)"

# ssh-keygen -t rsa -b 4096 -C "ondrej.slama@veeam.com"

# ssh-add -K ~/.ssh/id_rsa


# activate shell
source "$HOME/.zshrc"
