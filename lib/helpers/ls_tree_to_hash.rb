require 'json'
module GitHelpers
  module LsTreeToHashHelper
    def ls_to_hash
      build_hash(ls(:r).run)
    end
    private
    def build_ls_hash_hash(file)
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
end
