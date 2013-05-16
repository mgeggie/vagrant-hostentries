require 'vagrant'
require 'vagrant/util/platform'

module VagrantPlugins
  module Hostentries
  	module BSD
  		class Host < Vagrant.plugin("2", :host)
  			include Vagrant::Util

  			def self.match?
  				Vagrant::Util::Platform.darwin? || Vagrant::Util::Platform.bsd?
  			end

  			def self.precedence
  				# Set a lower precedence, since we're supposed to override 
  				# Vagrant's built-in BSD Host, but don't implement everything
  				3
  			end

  			def initialize(*args)
  				super
  			end

  			def update_hosts_entry(ip, name)
  				`cat /etc/hosts | grep -v '#{name} \#VAGRANTHOSTS$' >/tmp/hosts.tmp`
  				`sudo mv /tmp/hosts.tmp /etc/hosts`
  				`sudo echo '#{ip}    #{name} \#VAGRANTHOSTS' >>/etc/hosts`
  			end

  			def remove_hosts_entry(name)
  				`cat /etc/hosts | grep -v '#{name} \#VAGRANTHOSTS$' >/tmp/hosts.tmp`
  				`sudo mv /tmp/hosts.tmp /etc/hosts`
  			end
  		end
  	end
  end
end
