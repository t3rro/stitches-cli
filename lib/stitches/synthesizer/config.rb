require %(stitches/synthesizer/abstract)

###############################################################################
# read files merge config data and provide a single configuation structure
###############################################################################

class ConfigSynthesizer < AbstractSynthesizer
  def method_missing(method_name, *args, &block)
    abstract_method_missing(
      method_name,
      %i[namespace],
      *args,
      &block
    )
  end
end
