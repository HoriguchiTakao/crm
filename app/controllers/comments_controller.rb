class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to customer_url(@comment.customer_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    customer_id = @comment.customer_id
    @comment.destroy
    redirect_to customer_url(customer_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :customer_id)
  end

end
