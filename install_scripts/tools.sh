echo "Installing Tools"
sudo apt-get install -y thunar zsh light vim inotify-tools

# ZSH
if [ ! -f $HOME/.oh-my-zsh/.git ]; then
  echo ""
  echo "Installing Oh-my-zsh"
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# ZSH plugins
cd $HOME/.oh-my-zsh/plugins/ && git clone https://github.com/marlonrichert/zsh-autocomplete.git
cd $HOME/.oh-my-zsh/plugins/ && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Installing z
curl -sS https://webinstall.dev/zoxide | bash

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
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
# Make light work
sudo usermod -aG video $USER

echo ""
echo "Installing coding relevant tools"

# Install Elixir
sudo add-apt-repository "deb http://binaries.erlang-solutions.com/ubuntu focal contrib"
sudo apt-get update && sudo apt-get install -y esl-erlang elixir

# Install Docker
sudo apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu focal stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo chgrp docker /lib/systemd/system/docker.socket
sudo chmod g+w /lib/systemd/system/docker.socket
sudo usermod -aG docker $USER

DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
