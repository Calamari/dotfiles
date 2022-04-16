echo "Installing Tools"
sudo apt-get install -y thunar zsh light vim

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

if command -v code &> /dev/null ; then
  # GIT
  code --install-extension GitHub.copilot
  code --install-extension eamodio.gitlens
  code --install-extension pantajoe.vscode-elixir-credo
  code --install-extension ms-azuretools.vscode-docker
  # Frontend
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension esbenp.prettier-vscode
  code --install-extension zerokol.vscode-eex-beautify
  code --install-extension eamodio.gitlens
  # Go
  code --install-extension golang.go
  # Rust
  code --install-extension rust-lang.rust
  code --install-extension matklad.rust-analyzer
  # Elixir
  code --install-extension phoenixframework.phoenix
  # Ruby
  code --install-extension rebornix.ruby
  code --install-extension castwide.solargraph
  code --install-extension misogi.ruby-rubocop
  # YAML
  code --install-extension redhat.vscode-yaml
fi

# Make light work
sudo usermod -aG video calamari

# Install Elixir
sudo add-apt-repository "deb http://binaries.erlang-solutions.com/ubuntu focal contrib"
sudo apt-get update && sudo apt-get install -y esl-erlang elixir
