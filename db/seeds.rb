# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'youtube_it'
API_KEY = "AIzaSyCJQy1o0qwdB7LzwZ5gmLiSUUap6nfBpxw"
client = YouTubeIt::Client.new(:dev_key => API_KEY)
video = client.videos_by(:query => "penguin", :per_page => 1)
Video.create(:title => video.videos[0].title, :url => video.videos[0].player_url, :image => video.videos[0].thumbnails[0].url)

