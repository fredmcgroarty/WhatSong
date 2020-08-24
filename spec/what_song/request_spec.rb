describe WhatSong::Request do
  describe 'initialize' do
    it 'builds a basic uri object' do
      api_query = described_class.new(api_key: 'foo')
      expected_output = 'http://ws.audioscrobbler.com/2.0?format=json&api_key=foo'

      expect(api_query.uri.to_s).to eq expected_output
    end
  end

  describe '#add_parameter' do
    it 'adds to the http_path' do
      api_query = described_class.new(api_key: 'foo')

      expected_output = 'http://ws.audioscrobbler.com/2.0?format=json&api_key=foo'
      expect(api_query.uri.to_s).to eq expected_output

      expected_output = 'format=json&api_key=foo&things=lel'
      expect(api_query.add_parameter('things', 'lel')).to eq expected_output

      expected_output = 'http://ws.audioscrobbler.com/2.0?format=json&api_key=foo&things=lel'
      expect(api_query.uri.to_s).to eq expected_output
    end
  end
end
