echo "Installing Tools"
sudo apt-get install -y thunar zsh

# ZSH
if [ ! -f $HOME/.oh-my-zsh/.git ]; then
  echo ""
  echo "Installing Oh-my-zsh"
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# ZSH plugins
cd $HOME/.oh-my-zsh/plugins/ && git clone https://github.com/marlonrichert/zsh-autocomplete.git
cd $HOME/.oh-my-zsh/plugins/ && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Ruby
if [ ! -f $HOME/.rvm/bin/rvm ]; then
  echo ""
  echo "Installing Ruby"
  curl -sSL https://get.rvm.io | bash -s stable --ruby
fi
