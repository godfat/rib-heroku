
module Rib; end
module Rib::Heroku
  def self.run argv
    require 'heroku/command'
    require 'rib-heroku/monkey_patch'
    split = argv.index('--') || argv.size
    argv.delete('--')
    argv_heroku, argv_rib = argv[0...split], argv[split..-1]
                 args_rib = " #{argv_rib.join(' ')}" unless argv_rib.empty?
    Heroku::Command.load
    Heroku::Command.run('run', ["rib#{args_rib}"] + argv_heroku)
  end

  def self.load sock, out, timeout=nil
    require 'rib'
    sock.puts(load_script)
    sock.flush
    2.times do # eat load_script outputs
      IO.select([sock], nil, nil, timeout)
      msg = sock.gets
    end
  end

  def self.load_script
    @load_script ||= File.read(Rib.config_path).tr("\n", ';') +
      ";require 'rib/app/auto';Rib::Auto.load;Rib::Skip"
  end
end
