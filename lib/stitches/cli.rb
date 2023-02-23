require %(tty-option)

# shared command behavior for all commands in Stitches
class StitchesCommand
  include TTY::Option
  flag :help do
    short %(-h)
    long %(--help)
    desc %(Print usage)
  end
end

class ConfigCommand < StitchesCommand
  include TTY::Option

  usage do
    desc %(manage configuration)
    program %(stitches)
    command %(config)
  end

  def run(argv)
    parse(argv)
    if params[:help]
      print help
      exit
    else
      pp params.to_h
    end
  end
end

class InfraCommand < StitchesCommand
  usage do
    desc %(manage configuration)
    program %(stitches)
    command %(infa)
  end

  def run(argv)
    parse(argv)
    if params[:help]
      print help
      exit
    else
      pp params.to_h
    end
  end
end

class Command < StitchesCommand
  usage do
    desc %(stitch together infrastructure)
    program %(stitches)
  end

  argument :subcommand do
    desc %(subcommand for stitches)
    required
  end

  def run
    argv = ARGV
    parse(argv)

    if params[:help]
      print help
      exit
    else
      [
        ConfigCommand.new,
        InfraCommand.new
      ].each do |scmd|
        scmd.run(argv)
      end
    end
  end
end
