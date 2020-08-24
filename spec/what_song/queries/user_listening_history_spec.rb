describe WhatSong::Queries::UserListeningHistory do
  let(:request) do
    WhatSong::Request.new(api_key: ENV['API_KEY'])
  end

  describe '#perform' do
    it 'returns an array of Song', vcr: { record: :new_episodes, cassette_name: 'user_listening_history' } do
      user_tracklist = described_class.new(
        request: request, username: 'freddymcgroarty'
      )

      expect(user_tracklist.perform).to be_all(WhatSong::Song)
    end
  end
end
