# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.delete_all

Article.create!(
  title: 'Let’s End The Search For Mobile TV',
  url: 'http://techcrunch.com/2014/03/22/can-we-end-the-search-for-mobile-tv/',
  description: 'Test article',
  author: 'Tom Limongello'
)

Article.create!(
  title: 'A May-December Media Strategy Could Help Locally Focused Startups',
  url: 'http://techcrunch.com/2014/03/22/the-may-december-media-strategy-a-winning-mashup-for-locally-focused-startups/',
  description: 'Test article',
  author: 'Jonathan Sills'
)
