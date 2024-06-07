puts 'Destroying users, lists, recipes, and bookmarks...'
List.destroy_all
Recipe.destroy_all
Bookmark.destroy_all
User.destroy_all
puts 'Done'

puts 'Creating users...'
rachael = User.create!(email: 'rach@me.com', password: '123456')
puts 'User created'

puts 'Creating recipes and lists...'
cake = Recipe.create!(user_id: rachael.id, name: 'Chocolate cake', description: 'A rich chocolate cake', rating: 8.5)
puts 'cake'
desserts = List.create!(title: 'Desserts', user_id: rachael.id, comment: 'Really good list')
puts 'desserts'
Bookmark.create!(recipe: cake, list: desserts, comment: 'Yummmm!')
puts 'first bookmark'
pesto = Recipe.create!(user_id: rachael.id, name: 'Pesto Bowl', description: 'Chicken, tomato, and avocado over quinoa and spinach rice', rating: 9)
puts 'pesto'
dinners = List.create!(title: 'Dinners', user_id: rachael.id, comment: 'my go-to for dinners')
puts 'dinners'
Bookmark.create!(recipe: pesto, list: dinners, comment: "Aaron's favorite")
puts 'Done.'
