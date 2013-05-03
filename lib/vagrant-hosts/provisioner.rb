require 'log4r'
require 'vagrant'

module VagrantPlugins
	module Hosts
		class Provisioner < Vagrant.plugin("2", :provisioner)
			def provision
				@logger = Log4r::Logger.new("vagrant::plugins::hosts")

				@logger.info("Adding host entries to guest.")
				@machine.env.active_machines.each do |machine|
					@machine.guest_capability :add_hosts_entry, machine.config.ssh.host, machine.config.hostname
					@logger.info("Added entry for #{machine.config.hostname} to #{@machine.config.hostname}")
					machine.guest_capability :add_hosts_entry, @machine.config.ssh.host, @machine.config.hostname
					@logger.info("Added entry for #{@machine.config.hostname} to #{machine.config.hostname}")
				end

			end
		end