Vagrant.configure(2) do |config|
	[...]
	config.vm.box = "centos/8"
	config.vm.box_url = "~/goinfree/iso_file"

	config.vm.define "meunostuS" do |control|
		control.vm.hostname = "meunostuS"
		control.vm.network "public_network", ip: "192.168.42.110"
		control.vm.provider "virtualbox" do |v|
			v.customize ["modifyvm", :id, "--name", "meunostuS"]
			v.gui = false
			v.memory = "512"
			v.cpus = 1
		end
		config.vm.provision :shell, :inline => SHELL
			# [...]
		SHELL
		    control.vm.provision "shell", path: "provision.sh"
	end
	config.vm.define "meunostuSW" do |control|
		control.vm.hostname = "meunostuSW"
		control.vm.network "public_network", ip: "192.168.42.111"
		control.vm.provider "virtualbox" do |v|
			v.customize ["modifyvm", :id, "--name", "meunostuSW"]
			v.gui = false
			v.memory = "512"
			v.cpus = 1
		end
		config.vm.provision "shell", inline: <<-SHELL
			# [..]
		SHELL
		control.vm.provision "shell", path: "provision.sh"
	end
end