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
video = client.videos_by(:query => "summer makeup tutorial", :per_page => 6)
Category.create(name: "Summer makeup")
1.upto(5) do |i|
  video.videos.each do |vid|
    Video.create(category_id: 1, :title => vid.title, :url => vid.player_url, :image => vid.thumbnails[i].url)
  end
end

