# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Video.destroy_all
Category.destroy_all

    redtube_hash = {}

  num = 0
CSV.open("/home/jalil/dev/pface/db/stileproject.csv","r") do |row|
  row.each do |vid|

    id,title,date_added,url,duration,username,tags,category,thumbs, *rest = vid
    #redtube_hash[category] = title,url,thumb
    thumb = thumbs.split(";")[0] if thumbs
    category = category.split(";")[0] if category
    #puts "#{thumb} => #{url} => #{category}" if category
    #category1 = Category.new(name: category) if category =! nil
      next if category == nil
        category1 = Category.new(name: category)
         if category1.save 
          #puts category1.inspect
          Video.create(title: title, url: url, image: thumb, category_id: category1.id)
         else
         cat = Category.find_by_name(category1.name)
          #puts cat.inspect
          Video.create(title: title, url: url, image: thumb, category_id: cat.id)
   end
  end
end

  
  #num = 0
