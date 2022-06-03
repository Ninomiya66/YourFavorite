class Public::ReviewsController < ApplicationController

  def index
    @reviews =Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save!
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    if @review = Review.find(params[:id])
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
    params.require(:review).permit(:image, :name, :maker, :genre, :price, :introduction, :status)
  end

end
