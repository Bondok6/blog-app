require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comments Validation' do
    it 'comments_counter should be two' do
      user = User.new(name: 'Kyrillos Bondok', posts_counter: 0)
      user.save

      post = Post.new(title: 'GOT', text: 'This is a content for testing', comments_counter: 1, likes_counter: 0,
                      author_id: user.id)
      post.save

      comment = Comment.new(author_id: user.id, post_id: post.id)
      comment.save

      expect(comment.post.comments_counter).to eq(2)
    end
  end
end
