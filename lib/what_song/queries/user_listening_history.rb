module WhatSong
  module Queries
    class UserListeningHistory
      attr_reader :request, :songs

      def initialize(request:, username:)
        @request = request

        @request.add_parameter('method', 'user.getRecentTracks')
        @request.add_parameter('user', username)
      end

      def perform
        json = request.perform

        @songs = json.dig('recenttracks', 'track')
                     .map { |track| Song.parse_from_track(track) }
      end
    end
  end
end
