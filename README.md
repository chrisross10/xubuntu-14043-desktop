# xubuntu-14043-desktop

This repository uses Vagrant to spin up a Xubuntu desktop (v14.04.3) for playing around in a development environment.

See [Vagrant](https://www.vagrantup.com/docs/getting-started/) to get up and running first.

This particular box bootstraps the following:

+ Git
+ Ruby with rbenv
+ Rake
+ NodeJs
+ Rails
+ PostgreSql
+ Atom (plus additional packages)
  - cucumber
  - git-plus
  - linter
  - linter-ruby
  - minimap
  - package-sync
  - ruby-test
  - script
+ JDK
+ Clojure
+ Vim plugins

After the installation is complete, I have a post-installation script which sets the global Ruby version and installs the Atom packages.
(For some reason the Atom packages don't install properly during the bootstrap phase).
