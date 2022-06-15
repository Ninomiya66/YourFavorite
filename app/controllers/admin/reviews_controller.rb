class Admin::ReviewsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to admin_review_path(@review)
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:customer_id, :genre, :name, :maker, :introduction, :price, :status, :image)
  end

end
