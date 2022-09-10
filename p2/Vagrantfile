Vagrant.configure("2") do |config|

    config.vm.box = "centos/8"
    config.vm.box_url = "../CentOS-8-Vagrant-8.3.2011-20201204.2.x86_64.vagrant-virtualbox.box"
    config.vm.hostname = "meunostuS"
    config.vm.provider "virtualbox" do |vb|
        vb.name = "meunostuS"
        vb.memory = 4096
        vb.cpus = 4
    end
    config.vm.network "public_network", bridge: "en0: Ethernet", ip: "192.168.42.110"
    config.vm.provision "shell", path: "./scripts/setup.sh"
end