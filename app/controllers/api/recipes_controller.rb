class Api::RecipesController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @recipes = Recipe.alli

    search_term = params[:search]
    if search_term
      @recipes = @recipes.where(
                              "title iLIKE ? OR description iLIKE ? OR ingredients iLIKE ?", 
                              "%#{search_term}%",
                              "%#{search_term}%",
                              "%#{search_term}%"
                              )
    end

    render "index.json.jbuilder"
  end

  def create
    @recipe = Recipe.new(
                          title: params[:title],
                          chef: params[:chef],
                          ingredients: params[:ingredients],
                          directions: params[:directions]
                          )
    @recipe.save

    render "create.json.jbuilder"
  end

  def show
    @recipe = Recipe.find(params[:id])
    render "show.json.jbuilder"
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.title = params[:title] || @recipe.title
    @recipe.chef = params[:chef] || @recipe.chef
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.image_url = params[:image_url] || @recipe.image_url

    @recipe.save
    render "show.json.jbuilder"
  end
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    render json: {message: "sucessfully destroyed"}
  end
end
