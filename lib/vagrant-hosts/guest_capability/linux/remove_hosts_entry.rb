module VagrantPlugins
	module Hosts
		module GuestCapability
			module Linux
  			module RemoveHostsEntry
  				def self.remove_hosts_entry(machine, name)
  					machine.communicate.tap do |comm|
  						comm.sudo("cat /etc/hosts | grep -v '#{name} \#VAGRANTHOSTS$' >>/etc/hosts.tmp">)
  						comm.sudo("mv /etc/hosts.tmp /etc/hosts")
  					end
  				end
  			end
			end
		end
	end
end