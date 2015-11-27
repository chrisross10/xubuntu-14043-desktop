echo "<<<<<<< SET KEYBOARD TO UK >>>>>>>"
sudo setxkbmap -layout gb
#echo "setxkbmap gb" >> ~/.bashrc

echo "<<<<<<< INSTALLING AND SETTING GLOBAL RUBY VERSION >>>>>>>"
# list all available versions:
rbenv install -l
# install a Ruby version:
rbenv install 2.2.3
# choose default ruby version on your system
rbenv global 2.2.3
ruby -v
