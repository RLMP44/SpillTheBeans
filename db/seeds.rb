puts 'Destroying users, lists, recipes, and bookmarks...'
User.destroy_all
List.destroy_all
Recipe.destroy_all
Bookmark.destroy_all
puts 'Done'

puts 'Creating users...'
rachael = User.create!(email: 'rach@me.com', password: '123456')
puts 'User created'

puts 'Creating recipes and lists...'
cake = Recipe.create!(title: 'Chocolate cake', overview: 'A rich chocolate cake', rating: 8.5)
desserts = List.create!(title: 'Desserts')
Bookmark.create!(recipe: cake, list: desserts)
pesto = Recipe.create!(title: 'Pesto Bowl', overview: 'Yummmmm', rating: 9)
dinners = List.create!(title: 'Dinners')
Bookmark.create!(recipe: pesto, list: dinners)
puts 'Done.'
