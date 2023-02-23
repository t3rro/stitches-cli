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
