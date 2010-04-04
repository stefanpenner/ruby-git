require 'commands/shortlog'
module GitCommands
  module Authors
    def authors
      shortlog(:s).run.sort.uniq.collect{|u| u.gsub(/\d+\t/,'')}
    end
  end
end

