#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/what_song'

def run
  request = WhatSong::Request.new(api_key: ENV['API_KEY'])

  run_instructions = WhatSong::RunInstructions.new(request)
  run_instructions.parse(ARGV)

  options = run_instructions.options

  songs = options.query.perform

  WhatSong::Display.new(
    songs: songs,
    title: options.title
  ).perform
end

run
