class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:name, :body))

    redirect_to @post
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to :back

  end
end
