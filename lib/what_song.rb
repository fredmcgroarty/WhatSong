# frozen_string_literal: true

module WhatSong
  require 'dotenv/load'
  require 'json'
  require 'net/http'
  require 'optparse'
  require 'uri'
  lib_dir = File.dirname(__FILE__)
  require "#{lib_dir}/what_song/display"
  require "#{lib_dir}/what_song/request"
  require "#{lib_dir}/what_song/run_instructions"
  require "#{lib_dir}/what_song/song"
  require "#{lib_dir}/what_song/queries"
end
