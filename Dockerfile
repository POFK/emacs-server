FROM ubuntu:focal
MAINTAINER TX Mao <mtianxiang@gmail.com>

# locale
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo "Asia/Shanghai" > /etc/timezone
#RUN curl http://git.storage.datalab/POFK/ansible-init/raw/main/files/add_caches.sh | sh -s apt ubuntu focal
#RUN curl http://git.storage.datalab/POFK/ansible-init/raw/main/files/add_caches.sh | sh -s conda

# emacs
#RUN apt update -y && apt install -y curl git emacs unzip texlive-full \
RUN apt update -y && apt install -y curl git emacs unzip \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && rm -rf /tmp/*

# dependences
RUN apt update -y && apt-get install -y \
        sudo \
        zathura \
        fonts-symbola \
        fonts-noto-cjk \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && rm -rf /tmp/*
#   && rm -rf /tmp/* \
#   && echo ". /etc/profile.d/conda.sh" >> $HOME/.bashrc \
#   && echo "conda activate base" >> $HOME/.bashrc \
#   && echo "Set disable_coredump false" >> /etc/sudo.conf

## mu/mu4e
#RUN apt update -y &&\
#    apt install -y libgmime-3.0-dev libxapian-dev guile-2.2-dev html2text xdg-utils offlineimap

RUN apt update -y &&\
	apt install -y fd-find ripgrep sbcl grip graphviz shellcheck

#ADD http://nexus.storage.datalab/repository/raw-host/fonts/pyim-greatdict.pyim.gz /opt/dict/pyim-greatdict.pyim.gz
#RUN chown -R abc /opt/dict && chgrp -R abc /opt/dict

# change the following
#COPY entrypoint.sh /entrypoint.sh

#RUN chmod ugo+x /entrypoint.sh

ENTRYPOINT ["emacs","--daemon"]
