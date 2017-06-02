class LikesController < ApplicationController

  def new
    create
  end

  def create
    turtlegram = Turtlegram.find(params[:turtlegram_id])
    like = turtlegram.new_like(current_user)
    redirect_to "/turtlegrams"
  end
end
