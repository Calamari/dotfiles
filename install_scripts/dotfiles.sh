echo "Copying dotfiles"
rm ~/.bashrc ; ln -s ~/dotfiles/.bashrc ~/.bashrc
rm ~/.bash_profile ; ln -s ~/dotfiles/.bash_profile ~/.bash_profile
rm ~/.git-completion.bash ; ln -s ~/dotfiles/.git-completion.bash ~/.git-completion.bash
rm ~/.gitconfig ; ln -s ~/dotfiles/.gitconfig ~/.gitconfig
rm ~/.gitignore ; ln -s ~/dotfiles/.gitignore ~/.gitignore
rm ~/.railsrc ; ln -s ~/dotfiles/.railsrc ~/.railsrc
rm ~/.rspec ; ln -s ~/dotfiles/.rspec ~/.rspec
rm ~/.zshrc ; ln -s ~/dotfiles/.zshrc ~/.zshrc
rm ~/.zsh_profile ; ln -s ~/dotfiles/.zsh_profile ~/.zsh_profile
