# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative 'platforms'
require_relative 'episodes'

Platform.destroy_all
Platform.create! PlatformData::sample_attributes
Episode.destroy_all  
Episode.create!  EpisodeData::sample_attributes
puts "inserted the following\nPlatforms :#{PlatformData::sample_attributes.length}\nEpisodes  :#{EpisodeData::sample_attributes.length}" 