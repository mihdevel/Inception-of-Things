Vagrant.configure("2") do |config|

    config.vm.box = "centos/7"
    config.vm.hostname = "meunostuS"
    config.vm.provider "virtualbox" do |vb|
        vb.name = "meunostuS"
        vb.memory = 4096
        vb.cpus = 4
    end
    config.vm.network "private_network", ip: "192.168.42.110"
    config.vm.provision "shell", privileged: false, path: "./scripts/setup.sh"
end