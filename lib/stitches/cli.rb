require %(tty-command)
require %(tty-prompt)
require %(tty-option)

class Command
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

  def run
    parse(ARGV)
    if params[:help]
      print help
      exit
    else
      pp params.to_h
    end
  end
end
