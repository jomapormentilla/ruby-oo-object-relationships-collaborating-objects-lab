class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize( name )
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename( file )
        filename = file.split(" - ")
        artist = filename[0]
        songname = filename[1]

        song = self.new( songname )
        song.artist = Artist.new( artist )
        song
    end

    def artist_name=( name )
        @artist = Artist.find_or_create_by_name( name )
    end
end