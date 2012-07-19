
require "#{dir = File.dirname(__FILE__)}/task/gemgem"
Gemgem.dir = dir

($LOAD_PATH << File.expand_path("#{Gemgem.dir}/lib")).uniq!

desc 'Generate gemspec'
task 'gem:spec' do
  Gemgem.spec = Gemgem.create do |s|
    require 'rib-heroku/version'
    s.name    = 'rib-heroku'
    s.version = Rib::Heroku::VERSION

    %w[heroku].each{ |g| s.add_runtime_dependency(g) }
    s.add_runtime_dependency('rib', '>=1.1.0')
  end

  Gemgem.write
end
