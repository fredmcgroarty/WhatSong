module WhatSong
  class RunInstructions
    VERSION = '1.0.0'.freeze

    attr_reader :options, :request

    def initialize(request)
      @request = request
    end

    def parse(args)
      @options = ScriptOptions.new(request)
      OptionParser.new do |parser|
        @options.define_options(parser)
        parser.parse!(args)
      end
      @request = @options.request
      @options
    end

    class ScriptOptions
      attr_accessor :request,
                    :query,
                    :title

      def initialize(request)
        @request = request
      end

      def define_options(parser)
        parser.banner = 'Usage: what_song.rb [options]'
        parser.separator ''
        parser.separator 'Specific options:'

        perform_common_options(parser)

        perform_listening_history_query(parser)
        perform_song_output_limit(parser)
      end

      private

      def perform_common_options(parser)
        parser.separator ''
        parser.separator 'Common options:'
        parser.on_tail('-h', '--help', 'Show this message') do
          puts parser
          exit
        end
        parser.on_tail('--version', 'Show version') do
          puts VERSION
          exit
        end
      end

      def perform_song_output_limit(parser)
        parser.on('--sl',
                  '--song-limit LIMIT',
                  'Limit song output to LIMIT') do |limit|
          request.add_parameter('limit', limit)
        end
      end

      def perform_listening_history_query(parser)
        parser.on('--lh',
                  '--user-listening-history USERNAME',
                  'List recent tracks for a given USERNAME.') do |username|
          request.add_parameter('username', username)
          self.query = WhatSong::Queries::UserListeningHistory.new(
            request: request, username: username
          )
          self.title = "Listing tracks from #{username}."
        end
      end
    end
  end
end
