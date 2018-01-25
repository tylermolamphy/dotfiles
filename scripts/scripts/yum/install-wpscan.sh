yum install -y gcc ruby-devel libxml2 libxml2-devel libxslt libxslt-devel libcurl-devel patch rpm-build
~/dotfiles/yum/install-rubyrails.sh
gem install bundle
wget https://github.com/wpscanteam/wpscan/archive/master.zip
unzip master.zip
cd wpscan-master && bundle install

