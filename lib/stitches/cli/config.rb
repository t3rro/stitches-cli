module Config
  # configuration extensions
  EXTENSIONS = %i[
    json
    toml
    yaml
    yml
    nix
    rb
  ].freeze

  class << self
    def xdg_config_home
      ENV.fetch(%(XDG_CONFIG_HOME), %(~/.config))
    end

    # return array of paths that can store a configuration
    def default_paths
      p = {}

      EXTENSIONS.each do |ext|
        p[ext] = [] unless p[ext]
        p[ext] << File.join(%(opt), %(share), %(stitches.#{ext}))
        p[ext] << File.join(%(/etc), %(stitches), %(stitches.#{ext}))
        p[ext].concat(Dir.glob(File.join(%(/etc/), %(stitches), %(conf.d), %(*.#{ext}))))
        p[ext] << File.join(xdg_config_home, %(stitches), %(stitches.#{ext}))
        p[ext].concat(Dir.glob(File.join(xdg_config_home, %(stitches), %(conf.d), %(*.#{ext}))))
      end

      # reorganize so files are read in correctly
      res = []
      (0..EXTENSIONS.length).each do |n|
        EXTENSIONS.each do |ext|
          res << p[ext][n]
        end
      end

      # remove rogue nils from globbing things that may not ext
      res.compact
    end
  end
end

require 'json'
puts JSON.pretty_generate(Config.default_paths)
