class Public::ReviewsController < ApplicationController

  before_action :authenticate_customer!, {only: [:new, :create, :edit, :update, :destroy]}

  def index
    @reviews =Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.customer_id = current_customer.id
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to reviews_path
  end

  # ストロングパラメータ
  private

  def review_params
    params.require(:review).permit(:customer_id, :image, :name, :maker, :genre, :price, :introduction, :status)
  end

end
