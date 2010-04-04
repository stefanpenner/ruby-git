module GitCommands
  module Shortlog
    def shortlog(*options)
      options = options.flatten
      @options = build_options(options)
      @action = 'shortlog' 
      self
    end
  end
end

