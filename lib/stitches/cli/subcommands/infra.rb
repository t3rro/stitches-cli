require_relative %(./stitches)

class InfraCommand < StitchesCommand
  usage do
    desc %(manage infrastructure)
    program %(stitches)
    command %(infra)
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
