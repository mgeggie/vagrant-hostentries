# -*- encoding: utf-8 -*-
#require File.expand_path('../lib/vagrant/hostmaster/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mike Geggie"]
  gem.email         = ["mike@hubub.com"]
  gem.description   = %q{vagrant-hosts is a Vagrant plugin to manage /etc/hosts entries on both the host OS and guest VMs.}
  gem.summary       = %q{Vagrant plugin to manage /etc/hosts entries.}
  gem.homepage      = "https://github.com/trigren/vagrant-hosts"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "vagrant-hosts"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"

  gem.add_development_dependency  'bundler'
  gem.add_development_dependency  'vagrant'
  gem.add_development_dependency  'rake'
end
