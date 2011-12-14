# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rib-heroku"
  s.version = "0.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lin Jen-Shin (godfat)"]
  s.date = "2011-12-15"
  s.description = "Ruby-Interactive-ruBy -- Yet another interactive Ruby shell\n\nRib is based on the design of [ripl][] and the work of [ripl-rc][], some of\nthe features are also inspired by [pry][]. The aim of Rib is to be fully\nfeatured and yet very easy to opt-out or opt-in other features. It shall\nbe simple, lightweight and modular so that everyone could customize Rib.\n\n[ripl]: https://github.com/cldwalker/ripl\n[ripl-rc]: https://github.com/godfat/ripl-rc\n[pry]: https://github.com/pry/pry"
  s.email = ["godfat (XD) godfat.org"]
  s.executables = ["rib-heroku"]
  s.files = [
  ".gitignore",
  ".gitmodules",
  "LICENSE",
  "README.md",
  "Rakefile",
  "bin/rib-heroku",
  "lib/rib-heroku.rb",
  "lib/rib-heroku/monkey_patch.rb",
  "lib/rib-heroku/version.rb",
  "rib-heroku.gemspec",
  "task/.git",
  "task/.gitignore",
  "task/gemgem.rb"]
  s.homepage = "https://github.com/godfat/rib-heroku"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.12"
  s.summary = "Ruby-Interactive-ruBy -- Yet another interactive Ruby shell"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rib>, [">= 0"])
      s.add_runtime_dependency(%q<heroku>, [">= 0"])
    else
      s.add_dependency(%q<rib>, [">= 0"])
      s.add_dependency(%q<heroku>, [">= 0"])
    end
  else
    s.add_dependency(%q<rib>, [">= 0"])
    s.add_dependency(%q<heroku>, [">= 0"])
  end
end
