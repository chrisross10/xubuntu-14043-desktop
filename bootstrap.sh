# The output of all these installation steps is noisy. With this utility
sudo apt-get -y install rail
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo "<<<<<<< UPDATING PACKAGE INFORMATION >>>>>>>"
sudo apt-get -y update >/dev/null 2>&1

echo "<<<<<<< INSTALLING AND CONFIGURING GIT >>>>>>>"
sudo apt-get -y install git
#git config --global user.name "Name Surname"
#git config --global user.email nick@company.com
#git config --global color.ui true
#git config --global core.editor vi
#git config --global color.branch auto
#git config --global color.diff auto
#git config --global color.status auto

echo "<<<<<<< INSTALLING RUBY WITH RBENV >>>>>>>"
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
git clone https://github.com/ianheggie/rbenv-binstubs.git ~/.rbenv/plugins/rbenv-binstubs
bundle install --binstubs .bundle/bin

echo "<<<<<<< INSTALLING AND SETTING GLOBAL RUBY VERSION >>>>>>>"
# list all available versions:
rbenv install -l
# install a Ruby version:
rbenv install 2.2.3
# choose default ruby version on your system
rbenv global 2.2.3
ruby -v

echo "<<<<<<< INSTALLING RAILS >>>>>>>"
sudo apt-get -y install rails
sudo gem install rails

echo "<<<<<<< INSTALLING CHROMIUM >>>>>>>"
sudo apt-get -y install chromium-browser
echo "<<<<<<< INSTALL ATOM >>>>>>>"
sudo dpkg --install /vagrant/assets/atom/atom-amd64.deb
echo "<<<<<<< INSTALLING ATOM PACKAGES >>>>>>>"
apm install --packages-file /vagrant/assets/atom/packages.txt

