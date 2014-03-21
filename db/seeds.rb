# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.create!(
  title: 'What is going on...',
  url: 'http://google.com',
  description: 'Test article',
  author: 'John'
)

Article.create!(
  title: 'Out this world',
  url: 'http://google.com',
  description: 'Test article',
  author: 'Anton'
)
