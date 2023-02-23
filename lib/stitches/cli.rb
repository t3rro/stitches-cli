require %(tty-option)

class ConfigCommand
  include TTY::Option

  usage do
    desc %(manage configuration)
    program %(stitches)
    command %(config)
  end

  flag :help do
    short %(-h)
    long %(--help)
    desc %(Print usage)
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

class Command
  include TTY::Option

  usage do
    desc %(stitch together infrastructure)
    program %(stitches)
  end

  flag :help do
    short %(-h)
    long %(--help)
    desc %(Print usage)
  end

  def run
    argv = ARGV
    parse(argv)

    if params[:help]
      print help
      exit
    else
      [ConfigCommand.new].each do |scmd|
        scmd.run(argv)
      end
    end
  end
end
