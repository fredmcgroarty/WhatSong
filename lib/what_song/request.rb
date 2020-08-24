module WhatSong
  class Request
    API_URL = 'ws.audioscrobbler.com'.freeze
    API_VER = '/2.0'.freeze

    def initialize(api_key:, format: 'json')
      @parameters = ''
      add_parameter('format', format)
      add_parameter('api_key', api_key)
    end

    def add_parameter(key, value)
      parameter = "#{key}=#{value}"
      @parameters += (@parameters.empty? ? parameter : "&#{parameter}")
    end

    def perform
      JSON.parse(Net::HTTP.get(uri))
    end

    def uri
      URI::HTTP.build(
        host: API_URL,
        scheme: 'https',
        path: API_VER,
        query: @parameters
      )
    end

    private

    attr_writer :parameters
  end
end
