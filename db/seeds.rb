puts 'Destroying users, lists, recipes, and bookmarks...'
Bookmark.destroy_all
Recipe.destroy_all
List.destroy_all
User.destroy_all
puts 'Done'

puts 'Creating users...'
rachael = User.create!(email: 'rach@me.com', password: '123456', username: 'Rach')
puts 'User created'

puts 'Creating recipes and lists...'
cake = Recipe.create!(
  user: rachael,
  name: 'Chocolate cake',
  description: 'A rich chocolate cake',
  rating: 8.5,
  cook_time: 45,
  total_time: 60,
  difficulty: 5,
  oven_temp: 180,
  oven: true,
  ingredients:
    "cocoa powder, vanilla oil, olive oil, 2 eggs, flour, cinnamon, boiling water,
    salt",
  instructions:
    "Mix all dry ingredients. Add eggs, olive oil, vanilla, and mix.
    Stir in boiling water and mix to make mixture airy. Cook in rice cooker."
)
puts 'cake'
desserts = List.create!(title: 'Desserts', user: rachael, comment: 'Really good list')
puts 'desserts'
Bookmark.create!(recipe: cake, list: desserts, comment: 'Yummmm!')
puts 'first bookmark'
pesto = Recipe.create!(
  user: rachael,
  name: 'Pesto Bowl',
  description: 'Chicken, tomato, and avocado over quinoa and spinach rice',
  rating: 9,
  cook_time: 45,
  total_time: 60,
  difficulty: 3,
  oven_temp: 220,
  oven: true,
  ingredients:
    '⅓ cup prepared pesto, 2 tablespoons balsamic vinegar,
    1 tablespoon extra-virgin olive oil, ½ teaspoon salt, ¼ teaspoon ground pepper,
    2 chicken breasts, 4 cups arugula, 2 cups cooked quinoa,
    1 cup halved cherry tomatoes, 1 diced avocado',
  instructions:
    "STEP 1 Cook quinoa/rice
    STEP 2 Whisk pesto, vinegar, oil, salt and pepper in a large bowl.
    Remove 4 tablespoons of the mixture to a small bowl; set both bowls aside.
    STEP 3 Cook whole chicken breast wrapped in foil in oven with salt and pepper.
    STEP 4 Add arugula and quinoa/rice to the large bowl with the vinaigrette
    and toss to coat. Divide the arugula mixture between 4 bowls.
    Top with tomatoes, avocado and chicken.
    Drizzle each bowl with 1 tablespoon of the reserved pesto mixture.
    Feel free to add additional vegetables and swap the chicken for shrimp, steak, tofu, etc."
)
puts 'pesto'
dinners = List.create!(title: 'Dinners', user: rachael, comment: 'my go-to for dinners')
puts 'dinners'
Bookmark.create!(recipe: pesto, list: dinners, comment: "Aaron's favorite")
salad = Recipe.create!(
  user: rachael,
  name: 'Salad',
  description: 'the most delicious salad',
  rating: 8.5,
  cook_time: 0,
  total_time: 5,
  difficulty: 1,
  oven: false,
  ingredients:
    "cucumber, baby leaf, cabbage, carrots, corn, beans, lemon juice, olive oil, salt",
  instructions:
    "Mix all dry ingredients."
)
puts 'salad'
appetizers = List.create!(title: 'Appetizers', user: rachael, comment: 'The best starters')
puts 'appetizers'
Bookmark.create!(recipe: salad, list: appetizers, comment: 'Yerm!')
puts 'Done.'
