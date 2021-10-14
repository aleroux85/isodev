FROM isodev:main

ARG USER

# To do operations as your user do
# USER ${USER}

# Add custom setup and configuration here...

# use oh-my-zsh
# RUN sudo apt-get update -y && sudo apt-get install zsh -y
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# RUN sudo sed -i "/${USER}/s/\/bin\/bash/\/usr\/bin\/zsh/" /etc/passwd
# RUN sed -i /ZSH_THEME/s/robbyrussell/bira/ ~/.zshrc

# Install Golang
# RUN wget https://dl.google.com/go/go1.14.3.linux-amd64.tar.gz
# RUN sudo tar -C /usr/local -xzf go1.14.3.linux-amd64.tar.gz
# RUN sed -i 's/\/usr\/local\/bin/\/usr\/local\/bin:\/go\/bin:\/usr\/local\/go\/bin/' /etc/environment

# Finally switch back to root user for sshd
USER root