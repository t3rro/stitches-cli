require_relative %(./stitches)

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

    case params[:subcommand].to_s
    when %(infra)
      InfraCommand.new.run(argv)
    when %(config)
      ConfigCommand.new.run(argv)
    end

    if params[:help]
      print help
      exit
    end
  end
end
