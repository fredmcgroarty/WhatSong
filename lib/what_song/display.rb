module WhatSong
  class Display
    attr_reader :songs, :title

    def initialize(songs: [], title:)
      @songs = songs
      @title = title
    end

    def perform
      p title
      p '*****'
      songs.each do |song|
        p [song.artist, song.title].join(' - ')
      end
    end
  end
end
