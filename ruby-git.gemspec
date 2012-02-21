# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ruby-git/version"

Gem::Specification.new do |s|
  s.name        = "ruby-git"
  s.version     = Ruby::Git::VERSION
  s.authors     = ["Stefan Penner"]
  s.email       = ["stefan.penner@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{little lib to wrap commandline git}
  s.description = %q{little lib to wrap commandline git, its a toy}

  s.rubyforge_project = "ruby-git"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
