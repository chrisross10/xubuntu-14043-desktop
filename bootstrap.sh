# The output of all these installation steps is noisy. With this utility
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
git config --global color.ui true
git config --global core.editor vi
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto

echo "<<<<<<< INSTALLING RUBY WITH RBENV >>>>>>>"
git clone git://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
echo 'export PATH="/home/vagrant/.rbenv/bin:$PATH"' >> /home/vagrant/.bashrc
echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bashrc
git clone git://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
echo 'export PATH="/home/vagrant/.rbenv/plugins/ruby-build/bin:$PATH"' >> /home/vagrant/.bashrc
git clone https://github.com/sstephenson/rbenv-gem-rehash.git /home/vagrant/.rbenv/plugins/rbenv-gem-rehash
git clone https://github.com/ianheggie/rbenv-binstubs.git/ /home/vagrant/.rbenv/plugins/rbenv-binstubs

sudo gem install bundler
bundle install --binstubs /home/vagrant/.bundle/bin

# set .rbenv to be owned by vagrant user, not root
sudo chown -R vagrant:vagrant .rbenv

echo "<<<<<<< INSTALLING RAKE >>>>>>>"
gem install rake -v '10.4.2'

echo "<<<<<<< INSTALLING NODEJS >>>>>>>"
sudo apt-get -y install nodejs

echo "<<<<<<< INSTALLING RAILS >>>>>>>"
sudo apt-get -y install rails
sudo gem install rails

echo "<<<<<<< INSTALLING POSTGRESQL >>>>>>>"
sudo apt-get -y install postgresql libpq-dev

#echo "<<<<<<< INSTALLING CHROMIUM >>>>>>>"
#sudo apt-get -y install chromium-browser
echo "<<<<<<< INSTALL ATOM >>>>>>>"
sudo dpkg --install /vagrant/assets/atom/atom-amd64.deb
# for some reason the atom packages dont actually install despite the feedback. Moved this into postInstallation.sh
#echo "<<<<<<< INSTALLING ATOM PACKAGES >>>>>>>"
#apm install --packages-file /vagrant/assets/atom/packages.txt
