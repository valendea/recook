require 'rails_helper'

RSpec.describe Recipe, type: :model do
	before(:each) do
		@user = User.create!(first_name: 'sjak', last_name: 'hdajk', email: 'asd@gmail.com', password: '1234567')
	end

	describe '#search' do
		before(:each) do
			@user.recipes.create!(title: 'spagetti yummy', description: 'asd', ingredients: 'milk', steps:'wqer')
		end

		it 'gives the recipes that contains the term' do
			expect(Recipe.search('spagetti').count).to eq 1
		end

		it 'gives all the recipes instead if the term is not found' do
			expect(Recipe.search('haha')).to eq Recipe.all
		end
	end
end
