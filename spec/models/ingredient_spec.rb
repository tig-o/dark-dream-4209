require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'model methods' do
    it '#recipe_count' do
      burger = Recipe.create!(name: "Cheese Burger", complexity: 3, genre: "Grill")
      ramen = Recipe.create!(name: "Tonkotsu Ramen", complexity: 8, genre: "Soup")
      tacos = Recipe.create!(name: "Chicken Tacos", complexity: 6, genre: "Tex Mex")

      cheese = Ingredient.create!(name: "Cheese", cost: 2)

      recipe_ingredients_1 = RecipeIngredient.create!(recipe_id: burger.id, ingredient_id: cheese.id)
      recipe_ingredients_11 = RecipeIngredient.create!(recipe_id: tacos.id, ingredient_id: cheese.id)

      expect(cheese.recipe_count).to eq(2)
    end

    it '#self.cost' do
      burger = Recipe.create!(name: "Cheese Burger", complexity: 3, genre: "Grill")

      cheese = Ingredient.create!(name: "Cheese", cost: 2)
      meat = Ingredient.create!(name: "Meat", cost: 6)
      bread = Ingredient.create!(name: "Bread", cost: 2)

      recipe_ingredients_1 = RecipeIngredient.create!(recipe_id: burger.id, ingredient_id: cheese.id)
      recipe_ingredients_2 = RecipeIngredient.create!(recipe_id: burger.id, ingredient_id: meat.id)
      recipe_ingredients_3 = RecipeIngredient.create!(recipe_id: burger.id, ingredient_id: bread.id)

      expect(burger.ingredients.cost).to eq(10)
    end
  end
end
