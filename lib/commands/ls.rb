module GitCommands
  module Ls
    def ls(*options)
      @options = build_options(options)
      @action = 'ls-tree'
      self
    end
  end
end

