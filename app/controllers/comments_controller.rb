class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:success] = 'Comment has been added successfully'
      redirect_to user_post_path(current_user.id, params[:post_id])
    else
      render :create
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to user_post_path(params[:user_id], params[:post_id]), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
