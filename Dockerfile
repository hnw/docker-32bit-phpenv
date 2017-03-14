FROM 32bit/ubuntu:16.04

RUN apt-get update &&\
    apt-get install -y build-essential autoconf automake \
                       git-core wget curl bzip2 unzip \
                       libncurses5-dev zlib1g-dev gettext sudo pkg-config \
                       libssl-dev libsslcommon2-dev libcurl4-openssl-dev \
                       libjpeg-dev libpng-dev \
                       libmcrypt-dev libreadline-gplv2-dev libtidy-dev \
                       libxml2-dev libxslt1-dev &&\
    apt-get remove -y openssh-client manpages manpages-dev krb5-locales locales &&\
    apt-get -y autoremove &&\
    apt-get clean &&\
    useradd -m phpenv &&\
    echo 'phpenv ALL=NOPASSWD: ALL' > /etc/sudoers.d/phpenv &&\
    curl -L https://raw.github.com/CHH/phpenv/master/bin/phpenv-install.sh | sudo -u phpenv -i bash &&\
    echo 'export PATH="$HOME/.phpenv/bin:$PATH"' >> /home/phpenv/.bashrc &&\
    echo 'eval "$(phpenv init -)"' >> /home/phpenv/.bashrc &&\
    echo "mkdir .phpenv/plugins; cd .phpenv/plugins; git clone https://github.com/php-build/php-build.git" | sudo -u phpenv -i bash
