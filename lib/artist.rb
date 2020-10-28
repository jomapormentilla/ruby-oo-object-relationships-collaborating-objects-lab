class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize( name )
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{ |song| song.artist == self }
    end

    def add_song( song )
        song.artist = self
    end

    def self.find_or_create_by_name( name )
        artist = self.all.find{ |artist| artist.name == name }
        if artist == nil
            self.new( name )
        else
            artist
        end
    end

    def print_songs
        arr = []
        Song.all.each do |song|
            if song.artist == self
                arr << song.name
            end
        end
        puts arr.join("\n")
    end
end