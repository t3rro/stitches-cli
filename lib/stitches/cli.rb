require %(tty-command)
require %(tty-prompt)
require %(tty-option)

class Command
  include TTY::Option

  usage do
    program %(stitches)

    command %(run)

    desc %(Run a command in a new container)

    example %(Set working directory (-w)),
            %(  $ dock run -w /path/to/dir/ ubuntu pwd)

    example <<~MOUNT
      Mount volume
        $ dock run -v `pwd`:`pwd` -w `pwd` ubuntu pwd
    MOUNT
  end

  argument :image do
    required
    desc %(The name of the image to use)
  end

  argument :command do
    optional
    desc %(The command to run inside the image)
  end

  keyword :restart do
    default %(no)
    permit %w[no on-failure always unless-stopped]
    desc %(Restart policy to apply when a container exits)
  end

  flag :help do
    short %(-h)
    long %(--help)
    desc %(Print usage)
  end

  flag :detach do
    short %(-d)
    long %(--detach)
    desc %(Run container in background and print container ID)
  end

  option :name do
    required
    long %(--name string)
    desc %(Assign a name to the container)
  end

  option :port do
    arity one_or_more
    short %(-p)
    long %(--publish list)
    convert :list
    desc %(Publish a container's port(s) to the host)
  end

  def run
    if params[:help]
      print help
      exit
    else
      pp params.to_h
    end
  end
end
