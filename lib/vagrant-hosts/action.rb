module VagrantPlugins
	module Hosts
		module Action
			autoload :RemoveHostsEntry, 'vagrant-hosts/action/remove_hosts_entry'
			autoload :UpdateHostsEntry, 'vagrant-hosts/action/update_hosts_entry'

			class << self
				def update_hosts_entry
					#@update_hosts_entry ||= ::
					Vagrant::Action::Builder.new.tap do |b|
						b.use VagrantPlugins::Hosts::Action::UpdateHostsEntry
			  	end
				end

				def remove_hosts_entry
					@remove_hosts_entry ||= ::Vagrant::Action::Builder.new.tap do |b|
						b.use VagrantPlugins::Hosts::Action::RemoveHostsEntry
					end
				end
			end

		end
	end
end