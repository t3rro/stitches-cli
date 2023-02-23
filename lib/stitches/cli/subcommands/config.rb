require_relative %(./stitches)

class ConfigCommand < StitchesCommand
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
