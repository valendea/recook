require 'rails_helper'

RSpec.feature "SignInSpecs.rbs", type: :feature do
	describe 'sign in' do
  	before(:each) do
  		User.create(email: 'asd@example.com', password: '1234567')
  	end

  	it 'signs me in and show homepage title' do
  		visit '/login'
  		within('form[action="/sessions"]') do
  			find('#email').set('asd@example.com')
				find('#password').set('1234567')
  		end
  		click_button 'Log In'
  		expect(page).to have_content "Recook All"
  	end
  end
end
