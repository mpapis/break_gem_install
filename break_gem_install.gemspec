#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

=begin
Copyright 2014 Michal Papis <mpapis@gmail.com>

See the file LICENSE for copying permission.
=end

Gem::Specification.new do |spec|
  spec.name        = "break_gem_install"
  spec.version     = "0.0.1"
  spec.licenses    = ["MIT"]

  spec.authors     = ["Michal Papis"]
  spec.email       = ["mpapis@gmail.com"]

  spec.homepage    = "https://github.com/mpapis/break_gem_install"
  spec.summary     = "break rubygems based on https://github.com/rubygems/rubygems/issues/1040"

  spec.executables = ["break_gem_install"]
end
