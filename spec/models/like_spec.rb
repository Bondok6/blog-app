# require 'rails_helper'

# RSpec.describe Like, type: :model do
#   describe 'Likes Validation' do
#     it 'likes_counter should be one' do
#       user = User.new(name: 'Kyrillos Bondok', posts_counter: 0)
#       user.save

#       post = Post.new(title: 'GOT', text: 'This is a content for testing', comments_counter: 1, likes_counter: 0,
#                       author_id: user.id)
#       post.save

#       like = Like.new(author_id: user.id, post_id: post.id)
#       like.save

#       expect(like.post.likes_counter).to eq(1)
#     end
#   end
# end
