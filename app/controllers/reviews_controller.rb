class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end

  def new
    @club = Club.find(params[:club_id])
    if !params[:club_id]
      redirect_to root_path
    else
    @review = Review.new
    end
  end

  def create
    # binding.pry
    @review = Review.new(review_params)
      if @review.save
        redirect_to review_path(@review)
      else
        render :new
      end
  end



  def destroy
     @review = Review.find(params[:id]).destroy
     redirect_to user_path(@review.user)


   end


private

def review_params
  params.require(:review).permit(:content, :rank, :user_id, :club_id, :date)
end
end
