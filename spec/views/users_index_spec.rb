require 'rails_helper'

RSpec.describe 'Login', type: :system do
  describe 'users index page' do
    before(:each) do
      @user = User.create! name: 'eduardo', email: 'edu@gmail.com', password: '123456', confirmed_at: Time.now
      @user_two = User.create! name: 'carlos', email: 'carlos@gmail.com', password: '123456', confirmed_at: Time.now
      visit new_user_session_path
      page.fill_in 'Email', with: 'edu@gmail.com'
      page.fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'I can see the username of all other users.' do
      expect(page).to have_content('carlos')
    end

    it 'I can see the profile picture for each user.' do
      image = page.all('img')
      expect(image.size).to eql(2)
    end

    it 'I can see the number of posts each user has written.' do
      expect(page).to have_content('Number of posts: 0')
    end

    it 'When I click on a user, I am redirected to that user\'s show page.' do
      first('.btn-outline-secondary').click
      expect(page).to have_current_path user_path(@user)
    end
  end
end
