require 'vagrant'

module VagrantPlugins
  module Hosts
    class Plugin < Vagrant.plugin("2")
      name "Vagrant Hosts"
      description "Manages host files on guest and host OSes"

      host("bsd") do
        require_relative 'hosts/bsd/host'
        Hosts::BSD::Host
      end

      guest_capability("linux", "update_hosts_entry") do
        require_relative "guest_capability/linux/update_hosts_entry"
        GuestCapability::Linux::UpdateHostsEntry
      end

      guest_capability("linux", "remove_hosts_entry") do
        require_relative "guest_capability/linux/remove_hosts_entry"
        GuestCapability::Linux::RemoveHostsEntry
      end

      action_hook(:update_hosts_entry) do |hook|
        hook.after(::VagrantPlugins::ProviderVirtualBox::Action::Boot, Action.update_hosts_entry)
      end

      action_hook(:remove_hosts_entry) do |hook|
        hook.after(::VagrantPlugins::ProviderVirtualBox::Action::Destroy, Action.remove_hosts_entry)
      end

    end
  end
end
