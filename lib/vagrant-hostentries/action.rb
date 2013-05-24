module VagrantPlugins
  module Hostentries
    module Action
      autoload :RemoveHostsEntry, 'vagrant-hostentries/action/remove_hosts_entry'
      autoload :UpdateHostsEntry, 'vagrant-hostentries/action/update_hosts_entry'

      class << self
        def update_hosts_entry
          #@update_hosts_entry ||= ::
          Vagrant::Action::Builder.new.tap do |b|
            b.use VagrantPlugins::Hostentries::Action::UpdateHostsEntry
          end
        end

        def remove_hosts_entry
          @remove_hosts_entry ||= ::Vagrant::Action::Builder.new.tap do |b|
            b.use VagrantPlugins::Hostentries::Action::RemoveHostsEntry
          end
        end
      end

    end
  end
end
