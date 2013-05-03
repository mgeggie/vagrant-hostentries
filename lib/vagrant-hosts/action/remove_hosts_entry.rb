module VagrantPlugins
	module Hosts
		module Action
			class RemoveHostsEntry
        def initialize(app, env)
          @app = app
          @logger = Log4r::Logger.new("VagrantPlugins::Hosts")
        end

        def call(env)
          env[:machine].env.active_machines.each do |machine|
          	if !machine.guest.capability?(:remove_hosts_entry)
          		@logger.warn "Unsupported machine #{machine.config.name}"
          		next
          	end
          	env[:machine].env.active_machines.each do |m|
          		m_hostname = m.config.hostname
          	  machine.guest.capability(:remove_hosts_entry, m_hostname)
          	end
          end
          return @app.call(env)
        end
			end
		end
	end
end