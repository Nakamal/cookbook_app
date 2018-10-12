var recipeTemplate = document.queryselector('#recipe-card');
var recipeContainer = document.queryselector('.row');

axios.get("http://localhost:3000/api/recipes,").then(function(response) {
  console.log(response);
});

axios.get("http://localhost:3000/api/recipes").then(function(response) {
  var recipes = response.data;
  console.log(recipes);

  recipes.forEach(function(recipe) {
    var recipeClone = recipeTemplate.content.cloneNode(true);

      recipeClone.queryselector('.recipe-title').innerText = recipe.title;
      recipeClone.queryselector('.ingredients').innerText = recipe.ingredients;
      recipeClone.queryselector('.chef').innerText = recipe.chef;
      recipeClone.queryselector('.prep_time').innerText = recipe.["formatted"]["prep_time"];
      recipeClone.queryselector('.recipe-title').href = "/recipes/" + recipe["id"];
      recipeClone.queryselector('img.card-img-top').src = recipe["image_url"];

    recipeContainer.appendChild(recipeClone);
  });
});

