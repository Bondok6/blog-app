require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'show page' do

    before(:each) do
      @user_one = User.create! name: 'eduardo', email: 'edu@gmail.com', password: '123456', confirmed_at: Time.now
      # @user_two = User.create! name: 'carlos', email: 'carlos@gmail.com', password: '123456', confirmed_at: Time.now
      @first_post = Post.create! author_id: @user_one.id , title: 'First Post', text: 'Hello'
      # @second_post = Post.create! author_id: @user_two.id , title: 'Second Post', text: 'Bye'
      @first_comment = Comment.create!(post_id: @first_post.id, author_id: @user_one.id, text: 'First comment')
      # @second_comment = Comment.create!(post_id: @second_post.id, author_id: @user_two.id, text: 'Second comment')
      @first_like = Like.create!(post_id: @first_post.id, author_id: @user_one.id)
      @second_like = Like.create!(post_id: @first_post.id, author_id: @user_one.id)
      visit new_user_session_path
      page.fill_in 'Email', with: 'edu@gmail.com'
      page.fill_in 'Password', with: '123456'
      click_button 'Log in'
      first(".btn-outline-secondary").click
      click_on('See All Posts')
      click_on(@first_post.title)
    end


    it 'I can see the post\'s title.' do
      expect(page).to have_content(@first_post.title)
    end

    it 'I can see who wrote the post.' do
      expect(page).to have_content(@first_post.author.name)
    end

    it 'I can see how many comments it has.' do
      expect(page).to have_content('Comments: 1')
    end

    it 'I can see how many likes it has.' do
      expect(page).to have_content('2')
    end
    
    it 'I can see the post body.' do
      expect(page).to have_content(@first_post.text)
    end

    it 'I can see the username of each commentor.' do
      expect(page).to have_content(@first_comment.author.name)
    end

    it 'I can see the comment each commentor left.' do
      expect(page).to have_content(@first_comment.text)
    end

    # it 'I can see the user\'s username.' do
    #   expect(page).to have_content('eduardo')
    # end

    # it 'I can see the number of posts the user has written.' do
    #   expect(page).to have_content('Number of posts: 1')
    # end

    # it 'I can see a post\'s title.' do
    #   expect(page).to have_content(@first_post.title)
    # end

    # it 'I can see the first comments on a post.' do
    #   expect(page).to have_content(@first_comment.text)
    # end

    

    # it 'When I click on a post, it redirects me to that post\'s show page.' do
    #   click_on(@first_post.title)
    #   expect(page).to have_current_path user_post_path(@first_post.author, @first_post)
    # end
  end
end