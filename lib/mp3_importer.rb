require 'pry'

class MP3Importer
    attr_accessor :path

    @@all = []

    def initialize( file_path )
        @path = file_path
    end

    def files
        files = Dir.entries(@path)
        arr = []
        files.each do |file|
            if file.include?(".mp3")
                arr << file
            end
        end
        @@all = arr
    end

    def import
        @@all.each do |file|
            Song.new_by_filename( file )
        end
    end
end