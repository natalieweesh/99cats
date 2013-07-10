
cats = %w{Anderonda Becky Catterpillar Dazzle Easy Frazzle}
colors = %w{Infrared Red Orange Yellow Green Blue Indigo Violet Ultraviolet}

cats.each_with_index do |cat, index|
  Cat.create(
    name: cat,
    age: index,
    color: colors[index]
  )
end

cats.length.times do |index|
  CatRentalRequest.create(
    cat_id: 1,
    begin_date: "201#{index}-07-08",
    end_date: "201#{index}-07-08"
  )
end



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
