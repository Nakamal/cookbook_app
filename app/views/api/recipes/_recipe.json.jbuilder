
json.id recipe.id
json.title recipe.title
json.chef recipe.chef
json.ingredients recipe.ingredients
json.directions recipe.directions
json.image_url recipe.image_url

  json.formatted do
   json.directions recipe.directions_list
    json.ingredients recipe.ingredients_list
    json.created_at recipe.friendly_created_at
    json.prep_time recipe.friendly_prep_time
  end