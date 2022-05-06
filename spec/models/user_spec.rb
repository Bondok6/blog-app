require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validation' do
    subject { User.new(name: 'Kyrillos Bondok', posts_counter: 0) }

    before { subject.save }

    context "Name" do
      it 'name should be valid' do
        expect(subject).to be_valid
      end
  
      it 'name should be valid if it is nil' do
        subject.name = nil
        expect(subject).to_not be_valid
      end
    end
    
    context "Posts Counter" do
      it 'posts_counter should be valid' do
        expect(subject).to be_valid
      end
  
      it 'posts_counter should be vaild if it is string' do
        subject.posts_counter = 'hello'
        expect(subject).to_not be_valid
      end
  
      it 'posts_counter should be invalid if it is negative number' do
        subject.posts_counter = -5
        expect(subject).to_not be_valid
      end
    end
    
    context "Methods" do
      it 'return the last 3 comments' do
        (1..6).each do
          subject.posts.create(title: 'GOT', text: 'Game of Throuns')
        end
        expect(subject.recent_posts.count).to eq(3)
      end
    end
    
  end
end