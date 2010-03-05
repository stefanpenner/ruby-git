module GitCommands
  module Log
    def log(*options)
      @options = build_options(options)
      @action = 'log' 
      self
    end
  end
end
