module VagrantPlugins
	module Hosts
		module GuestCapability
			module Linux
			  module UpdateHostsEntry
  				def self.update_hosts_entry(machine, ip, name)
  					machine.communicate.tap do |comm|
  						comm.sudo("cat /etc/hosts | grep -v '#{name} \#VAGRANTHOSTS$' >>/etc/hosts.tmp")
  						comm.sudo("mv /etc/hosts.tmp /etc/hosts")
  						comm.sudo("echo '#{ip}    #{name} \#VAGRANTHOSTS' >>/etc/hosts")
  					end
  				end
  			end
		  end
		end
	end
end