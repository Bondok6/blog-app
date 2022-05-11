require 'rails_helper'

RSpec.describe 'User Show', type: :system do
  describe 'user show page' do

    before(:each) do
      @user = User.create! name: 'eduardo', email: 'edu@gmail.com', password: '123456', confirmed_at: Time.now
      # @user_two = User.create! name: 'carlos', email: 'carlos@gmail.com', password: '123456', confirmed_at: Time.now

      @first_post = Post.create! author_id: @user.id , title: 'first_post', text: 'Hello 1'
      @second_post = Post.create! author_id: @user.id , title: 'second_post', text: 'Hello 2'
      @third_post = Post.create! author_id: @user.id , title: 'third_post', text: 'Hello 3'


      visit new_user_session_path
      page.fill_in 'Email', with: 'edu@gmail.com'
      page.fill_in 'Password', with: '123456'
      click_button 'Log in'
      first(".btn-outline-secondary").click
    end


    it 'I can see the user\'s profile picture.' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end
    
    it 'I can see the user\'s username.' do
      expect(page).to have_content('eduardo')
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content('Number of posts: 3')
    end

    it 'I can see the user\'s bio.' do
      expect(page).to have_content('Bio')
    end

    it 'I can see the user\'s first 3 posts.' do
      expect(page).to have_content('first_post')
      expect(page).to have_content('second_post')
      expect(page).to have_content('third_post')
    end

    it 'I can see a button that lets me view all of a user\'s posts.' do
      expect(page).to have_content 'See All Posts' 
    end

    it 'When I click a user\'s post, it redirects me to that post\'s show page.' do
      click_on('See All Posts')
      click_on('first_post')
      expect(page).to have_current_path user_post_path(@user, @first_post)
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
      click_on('See All Posts')
      expect(page).to have_current_path user_posts_path(@user)
    end
  end
end