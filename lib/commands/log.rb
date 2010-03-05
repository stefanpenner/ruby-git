module GitCommands
  module Log
    def log(*options)
      options = options.flatten
      @options = build_options(options)
      @action = 'log' 
      self
    end
  end
end
