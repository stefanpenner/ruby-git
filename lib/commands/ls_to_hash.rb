require 'json'

module GitCommands
  module LsToHash
    module Helpers

      def self.build(array)

        @db = []
        array.each do |element|
          someNumber, type, sha1, path =  element.split(' ')
          file_name = File.basename(path)
          path = File.dirname(path)

          file = { :path => path, :sha1 => sha1, :data => file_name }

          self.build_hash file
        end

        @db
      end

      def self.build_hash(file)
        return @db.push(file) if file[:path] == '.'

        directory_names = file[:path].split('/')
        
        db_ref = @db
        
        directory_names.inject([]) do |path,data|
          path.push data
          destination = db_ref.detect {|element| element[:data] == data}
           
          unless destination
            destination =  { :data => data ,:path => path.join('/') , :children => [] }
            db_ref.push destination
          end
          db_ref = destination[:children]

          path
        end

        db_ref.push file
      end
    end

    def ls_to_hash(ref=:HEAD,*options)
      # todo: parse options and stuff
      #
      Helpers.build(ref(ref).ls(:r).run)
    end
  end
end
