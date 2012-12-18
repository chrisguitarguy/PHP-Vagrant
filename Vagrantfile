# -*- mode: ruby -*-
# vi: set ft=ruby :

PATH = File.expand_path(File.dirname(__FILE__))

Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.network :bridged
  config.vm.share_folder "src", "/srv/www", File.join(PATH, "src")
  config.vm.share_folder "conf", "/srv/conf", File.join(PATH, "conf")
  config.vm.share_folder "sites", "/srv/sites", File.join(PATH, "sites")
  config.vm.provision :shell, :path => "scripts/provision.sh"
end
