class Genre

    @@all = []
    attr_accessor :name

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select { |song|
            song.genre == self
        }
    end

    def artists
        artist_list = songs.map { |song|
            song.artist
        }
        artist_list.uniq
    end

end