require 'rails_helper'

RSpec.describe 'recipes index page' do
    it 'displays the name, complexity, genre of each recipe' do
        burger = Recipe.create!(name: "Cheese Burger", complexity: 3, genre: "Grill")
        ramen = Recipe.create!(name: "Tonkotsu Ramen", complexity: 8, genre: "Soup")
        tacos = Recipe.create!(name: "Chicken Tacos", complexity: 6, genre: "Tex Mex")

        visit "/recipes"
        
        within "#recipe#{burger.id}" do
            expect(page).to have_content("Name: Cheese Burger")
            expect(page).to have_content("Complexity: 3")
            expect(page).to have_content("Genre: Grill")
        end

        within "#recipe#{ramen.id}" do
            expect(page).to have_content("Name: Tonkotsu Ramen")
            expect(page).to have_content("Complexity: 8")
            expect(page).to have_content("Genre: Soup")
        end

        within "#recipe#{tacos.id}" do
            expect(page).to have_content("Name: Chicken Tacos")
            expect(page).to have_content("Complexity: 6")
            expect(page).to have_content("Genre: Tex Mex")
        end
    end
end