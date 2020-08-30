class Artist

    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def new_song(name, genre)
        Song.new(name, self, genre)
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def self.all
        @@all
    end

    def genres
        genre_list = songs.map { |song|
            song.genre
        }
        genre_list.uniq
    end

end

# Artist
#   #name
#     has a name (FAILED - 1)
#   .all
#     knows about all artist instances (FAILED - 2)
#   #songs
#     returns all songs associated with this Artist (FAILED - 3)
#   #new_song
#     given a name and genre, creates a new song associated with that artist (FAILED - 4)
#   #genres
#     has many genres, through songs (FAILED - 5)

# Song
#   #new
#     initializes with a name, an artist, and a genre (FAILED - 6)
#   .all
#     knows about all song instances (FAILED - 7)
#   #genre
#     belongs to a genre (FAILED - 8)
#   #artist
#     belongs to a artist (FAILED - 9)

# Genre
#   #name
#     has a name (FAILED - 10)
#   #songs
#     has many songs (FAILED - 11)
#   .all
#     knows about all genre instances (FAILED - 12)
#   #artists
#     has many artists, through songs (FAILED - 13)