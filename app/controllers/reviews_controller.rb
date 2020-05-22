class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @vinyl = Vinyl.find(params[:vinyl_id])
    @review.vinyl = @vinyl
    if @review.save
      redirect_to vinyl_path(@vinyl)
    else
      render "vinyls/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
