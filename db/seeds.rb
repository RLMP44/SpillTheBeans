puts 'Destroying users, lists, recipes, and bookmarks...'
Bookmark.destroy_all
Ingredient.destroy_all
Recipe.destroy_all
List.destroy_all
User.destroy_all
puts 'Done'

puts 'Creating users...'
rachael = User.create!(email: 'rach@me.com', password: '123456', username: 'Rach')
puts 'User created'

puts 'Creating recipes and lists...'

# ------------------- Creating cake --------------------------
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
  instructions:
    "Mix all dry ingredients. Add eggs, olive oil, vanilla, and mix.
    Stir in boiling water and mix to make mixture airy. Cook in rice cooker."
)
Ingredient.create!(name: 'cocoa powder', amount: '1 cup', recipe: cake)
Ingredient.create!(name: 'vanilla oil', amount: '1 tbsp', recipe: cake)
Ingredient.create!(name: 'olive oil', amount: '1 cup', recipe: cake)
Ingredient.create!(name: 'egg', amount: '2', recipe: cake)
Ingredient.create!(name: 'flour', amount: '1 cup', recipe: cake)
Ingredient.create!(name: 'cinnamon', amount: '1 pinch', recipe: cake)
Ingredient.create!(name: 'boiling water', amount: '1 cup', recipe: cake)
Ingredient.create!(name: 'salt', amount: '1 pinch', recipe: cake)

puts 'cake'
desserts = List.create!(title: 'Desserts', user: rachael, comment: 'Really good list')
puts 'desserts'
Bookmark.create!(recipe: cake, list: desserts, comment: 'Yummmm!')
puts 'first bookmark'

# ------------------- Creating pesto bowl ------------------------
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
Ingredient.create!(name: 'pesto', amount: '1/3 cup', recipe: pesto)
Ingredient.create!(name: 'balsamic vinegar', amount: '2 tbsp', recipe: pesto)
Ingredient.create!(name: 'olive oil', amount: '1 tbsp', recipe: pesto)
Ingredient.create!(name: 'chicken breast', amount: '2', recipe: pesto)
Ingredient.create!(name: 'arugula', amount: '4 cup', recipe: pesto)
Ingredient.create!(name: 'ground pepper', amount: '1/4 tsp', recipe: pesto)
Ingredient.create!(name: 'quinoa', amount: '2 cup', recipe: pesto)
Ingredient.create!(name: 'halved cherry tomatoes', amount: '1 cup', recipe: pesto)
Ingredient.create!(name: 'salt', amount: '1/2 tsp', recipe: pesto)
puts 'pesto'
dinners = List.create!(title: 'Dinners', user: rachael, comment: 'my go-to for dinners')
puts 'dinners'
Bookmark.create!(recipe: pesto, list: dinners, comment: "Aaron's favorite")

# ------------------- Creating salad -------------------------
salad = Recipe.create!(
  user: rachael,
  name: 'Salad',
  description: 'the most delicious salad',
  rating: 8.5,
  cook_time: 0,
  total_time: 5,
  difficulty: 1,
  oven: false,
  instructions:
    "Mix all dry ingredients."
)
Ingredient.create!(name: 'cucumber', amount: '1', recipe: salad)
Ingredient.create!(name: 'baby leaf', amount: '2 bag', recipe: salad)
Ingredient.create!(name: 'cabbage', amount: '1/4 head', recipe: salad)
Ingredient.create!(name: 'carrot', amount: '1', recipe: salad)
Ingredient.create!(name: 'corn', amount: '1 can', recipe: salad)
Ingredient.create!(name: 'mixed beans', amount: '1 can', recipe: salad)
Ingredient.create!(name: 'lemon juice', amount: '1 tbsp', recipe: salad)
Ingredient.create!(name: 'olive oil', amount: '1 tbsp', recipe: salad)
Ingredient.create!(name: 'salt', amount: '1 pinch', recipe: salad)
puts 'salad'
appetizers = List.create!(title: 'Appetizers', user: rachael, comment: 'The best starters')
puts 'appetizers'
Bookmark.create!(recipe: salad, list: appetizers, comment: 'Yerm!')
puts 'Done.'
