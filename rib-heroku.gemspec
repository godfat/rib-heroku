# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rib-heroku"
  s.version = "0.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lin Jen-Shin (godfat)"]
  s.date = "2012-07-19"
  s.description = "Run a [Rib][] console on Heroku Cedar with your Rib config!\n\n[Rib]: https://github.com/godfat/rib"
  s.email = ["godfat (XD) godfat.org"]
  s.executables = ["rib-heroku"]
  s.files = [
  ".gitignore",
  ".gitmodules",
  "CHANGES.md",
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
  s.rubygems_version = "1.8.24"
  s.summary = "Run a [Rib][] console on Heroku Cedar with your Rib config!"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<heroku>, [">= 0"])
      s.add_runtime_dependency(%q<rib>, [">= 1.1.0"])
    else
      s.add_dependency(%q<heroku>, [">= 0"])
      s.add_dependency(%q<rib>, [">= 1.1.0"])
    end
  else
    s.add_dependency(%q<heroku>, [">= 0"])
    s.add_dependency(%q<rib>, [">= 1.1.0"])
  end
end
