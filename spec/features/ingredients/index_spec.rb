require 'rails_helper'

RSpec.describe 'ingredients index page' do
    it 'displays list of ingredients and number of recipes each is used in' do
        burger = Recipe.create!(name: "Cheese Burger", complexity: 3, genre: "Grill")
        ramen = Recipe.create!(name: "Tonkotsu Ramen", complexity: 8, genre: "Soup")
        tacos = Recipe.create!(name: "Chicken Tacos", complexity: 6, genre: "Tex Mex")
       
        cheese = Ingredient.create!(name: "Cheese", cost: 2)
        meat = Ingredient.create!(name: "Meat", cost: 6)
        bread = Ingredient.create!(name: "Bread", cost: 2)
        noodles = Ingredient.create!(name: "Noodles", cost: 4)
        water = Ingredient.create!(name: "Water", cost: 1)
        spices = Ingredient.create!(name: "Spices", cost: 1)
        veggies = Ingredient.create!(name: "Vegetables", cost: 1)

        recipe_ingredients_1 = RecipeIngredient.create!(recipe_id: burger.id, ingredient_id: cheese.id)
        recipe_ingredients_2 = RecipeIngredient.create!(recipe_id: burger.id, ingredient_id: meat.id)
        recipe_ingredients_3 = RecipeIngredient.create!(recipe_id: burger.id, ingredient_id: bread.id)
        recipe_ingredients_4 = RecipeIngredient.create!(recipe_id: ramen.id, ingredient_id: meat.id)
        recipe_ingredients_5 = RecipeIngredient.create!(recipe_id: ramen.id, ingredient_id: noodles.id)
        recipe_ingredients_6 = RecipeIngredient.create!(recipe_id: ramen.id, ingredient_id: water.id)
        recipe_ingredients_7 = RecipeIngredient.create!(recipe_id: ramen.id, ingredient_id: spices.id)
        recipe_ingredients_8 = RecipeIngredient.create!(recipe_id: ramen.id, ingredient_id: veggies.id)
        recipe_ingredients_9 = RecipeIngredient.create!(recipe_id: tacos.id, ingredient_id: veggies.id)
        recipe_ingredients_10 = RecipeIngredient.create!(recipe_id: tacos.id, ingredient_id: meat.id)
        recipe_ingredients_11 = RecipeIngredient.create!(recipe_id: tacos.id, ingredient_id: cheese.id)

        visit "/ingredients"

        within "#ingredient#{cheese.id}" do
            expect(page).to have_content("Cheese: 2")
        end
        
        within "#ingredient#{meat.id}" do
            expect(page).to have_content("Meat: 3")
        end
        
        within "#ingredient#{veggies.id}" do
            expect(page).to have_content("Vegetables: 2")
        end
    end
end