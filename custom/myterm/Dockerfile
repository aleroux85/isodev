FROM isodev:main

ARG USER
ARG GO_VERSION

USER ${USER}
WORKDIR /home/${USER}
RUN sudo apt-get install -y apt-utils
RUN sudo apt-get update -y && sudo apt-get install snap -y
RUN sudo sed -i "s/\/usr\/local\/bin/\/usr\/local\/bin:\/snap\/bin/" /etc/environment

# setup vim
ADD .vimrc /home/${USER}/.vimrc
RUN sudo apt-get install -y ripgrep
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN wget https://raw.githubusercontent.com/thoughtstream/Damian-Conway-s-Vim-Setup/master/plugin/dragvisuals.vim -P .vim/plugin

# use oh-my-zsh
RUN sudo apt-get install zsh -y
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
RUN sudo sed -i "/${USER}/s/\/bin\/bash/\/usr\/bin\/zsh/" /etc/passwd
RUN sed -i /ZSH_THEME/s/robbyrussell/bira/ ~/.zshrc
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/${USER}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/${USER}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
RUN sed -i /plugins/s/git/git\ docker-compose\ zsh-autosuggestions\ zsh-syntax-highlighting/ ~/.zshrc
RUN echo "bindkey '^ ' autosuggest-accept" > ~/.oh-my-zsh/custom/binds.zsh
ADD setup_editor.sh ~/.oh-my-zsh/custom/scripts/setup_editor.sh
RUN echo 'alias tat="~/.oh-my-zsh/custom/scripts/setup_editor.sh"' >> ~/.zshrc

# fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN .fzf/install --key-bindings --completion --update-rc

# Install Golang
RUN wget "https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz"
RUN sudo tar -C /usr/local -xzf "go${GO_VERSION}.linux-amd64.tar.gz"
RUN sudo sed -i "s/\/usr\/local\/bin/\/usr\/local\/bin:\/home\/${USER}\/go\/bin:\/usr\/local\/go\/bin/" /etc/environment

# Get Lazydocker
RUN /usr/local/go/bin/go install github.com/jesseduffield/lazydocker@latest

RUN sudo apt-get install -y tmux
# RUN sudo /snap/bin/snap install btop

USER root
