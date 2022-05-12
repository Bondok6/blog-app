require 'rails_helper'

RSpec.describe 'Login', type: :system do
  describe 'login page' do
    before(:each) do
      User.create! name: 'eduardo', email: 'edu@gmail.com', password: '123456', confirmed_at: Time.now
      visit new_user_session_path
    end

    it 'I can see the username and password inputs and the "Submit" button.' do
      expect(page).to have_content('Log in')
      expect(page).to have_content('Password')
      expect(page).to have_content('Email')
    end

    it 'When I click the submit button without filling in the username and the password, I get a detailed error.' do
      page.fill_in 'Email', with: ''
      page.fill_in 'Password', with: ''
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'When I click the submit button after filling in the username and the password with incorrect data, I get a detailed error' do
      page.fill_in 'Email', with: 'anything@gmail.com'
      page.fill_in 'Password', with: '555555'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'When I click the submit button after filling in the username and the password with correct data, I am redirected to the root page' do
      page.fill_in 'Email', with: 'edu@gmail.com'
      page.fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_current_path root_path
    end
  end
end
