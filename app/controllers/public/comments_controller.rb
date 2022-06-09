class Public::CommentsController < ApplicationController

  def create
    review = Review.find(params[:review_id])
    comment = Comment.new(comment_params)
    comment.customer_id = current_customer.id
    comment.review_id = review.id
    comment.save
    redirect_to review_path(review)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to review_path(params[:review_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
