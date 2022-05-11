class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user = User.includes(:posts, :comments).find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    # @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      flash[:success] = 'Post has been added successfully'
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    flash[:success] = 'Post has been deleted successfully'
    redirect_to root_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
