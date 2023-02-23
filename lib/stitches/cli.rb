require %(tty-command)
require %(tty-prompt)
require %(tty-option)

module CLI
  class CLI
    def initialize(args)
      @args     = args
      @prompt   = TTY::Prompt.new
      @command  = TTY::Command.new
      @options  = {}
    end

    def run
      parse_options
      subcommand = @args.shift
      case subcommand
      when %(run)
        run_command
      when %(init)
        init_project
      when %(help)
        puts %(Available commands: run, init)
      else
        puts %(Invalid command: #{subcommand}. Type '--help' for a list of available commands.)
      end
    end

    private

    def parse_options
      opt = TTY::Option.new
      opt.on(
        %(-d DIRECTORY),
        %(--directory DIRECTORY),
        %(Working directory)
      ) do |dir|
        @options[:directory] = dir
      end
      opt.parse!(@args)
    end

    def run_command
      command = @prompt.ask(
        %(Enter command to run: )
      )
      result = @command.run(command, @options)
      puts result.out if result.success?
      puts result.err if result.failure?
    end

    def init_project
      puts %(Initializing project...)
    end
  end
end

CLI::CLI.new(ARGV).run if __FILE__ == $PROGRAM_NAME
