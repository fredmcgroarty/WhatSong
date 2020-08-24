module WhatSong
  class Song
    attr_reader :artist, :title

    def self.parse_from_track(track)
      new(
        artist: track.dig('artist', '#text'),
        title: track['name']
      )
    end

    def initialize(artist:, title:)
      @artist = artist
      @title = title
    end
  end
end
