# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
#function install {
#    echo installing $1
#    shift
#    apt-get -y install "$@" >/dev/null 2>&1
#}

echo Updating package information...
sudo apt-get -y update

echo Installing and configuring Git...
sudo apt-get -y install git
#git config --global user.name "Name Surname"
#git config --global user.email nick@company.com
#git config --global color.ui true
#git config --global core.editor vi
#git config --global color.branch auto
#git config --global color.diff auto
#git config --global color.status auto

echo Installing Ruby with rbenv...
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

git clone https://github.com/ianheggie/rbenv-binstubs.git ~/.rbenv/plugins/rbenv-binstubs
bundle install --binstubs .bundle/bin

echo Installing and setting global Ruby version...
# list all available versions:
rbenv install -l
# install a Ruby version:
rbenv install 2.1.2
# choose default ruby version on your system
rbenv global 2.1.2

echo Installing Rails...
sudo gem install rails

echo Installing wget...
sudo apt-get install wget

echo Install Atom...
wget https://atom.io/download/deb -O ~/Downloads/atom-amd64.deb
sudo dpkg -i ~/Downloads/atom-amd64.deb


