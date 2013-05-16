require 'log4r'

module VagrantPlugins
	module Hostentries
		module Action
			class UpdateHostsEntry
        def initialize(app, env)
          @app = app
          @logger = Log4r::Logger.new("VagrantPlugins::Hosts")
        end

        def call(env)
        	env[:host].update_hosts_entry(env[:machine].guest.capability(:read_ip_address), env[:machine].config.vm.hostname)
          env[:machine].env.active_machines.each do |machine|
          	m = env[:machine].env.machine(machine[0], machine[1])
          	if !m.guest.capability?(:update_hosts_entry)
          		@logger.warn "Unsupported machine #{machine.config.name}"
          		next
          	end
          	env[:machine].env.active_machines.each do |machine2|
          		m2 = env[:machine].env.machine(machine2[0], machine2[1])
          		m2_ip = m2.guest.capability(:read_ip_address)
          		m2_hostname = m2.config.vm.hostname
          		env[:ui].info "Adding IP: #{m2_ip} -> Hostname: #{m2_hostname}"
          	  m.guest.capability(:update_hosts_entry, m2_ip, m2_hostname)
          	end
          end
          return @app.call(env)
        end
			end
		end
	end
end
