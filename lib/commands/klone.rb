module GitCommands
  module Klone
    def klone(from, *options)
      options = options.flatten
      @options = build_options(options)

      unless @cloned
        from = Git.mock_remote || from
        `git clone #{from} #{@path} 2> /dev/null > /dev/null`
      end

      @cloned = true
      self
    end
  end
end

