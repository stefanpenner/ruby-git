require 'commands/all'
require 'fileutils'

class Git

  include GitCommands::Log
  include GitCommands::Ls
  include GitCommands::LsToHash
  include GitCommands::RepoHistory
  include GitCommands::Shortlog
  include GitCommands::Authors
  include GitCommands::Klone

  def initialize(path)
    @path = path
    @ref = :HEAD
  end

  def self.repo(path)
    path = File.expand_path(path)
    new(path)
  end

  def ref(ref)
    @ref = ref
    self
  end

  def path(p)
    @path = p
    self
  end

  def run
    results = []
    FileUtils.cd(@path) do
      results = IO.popen(to_command).readlines
    end
    results.map(&:strip)
  end

  def to_command
    "git #{@action} #{@ref} #{@options}"
  end

  private

    def build_options(options)

      options.map do |key|
        if key.is_a?(Hash)
          value = key.first
          key   = value.shift

          to_option(key,value)
        else
          to_option(key)
        end
      end.join(" ")
    end

    def to_option(key,value=nil)
      option = "-#{key} #{value}"
      option = "-#{option}" if key.to_s.length > 1
      option
    end
end

