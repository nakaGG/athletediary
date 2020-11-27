class DiariesController < ApplicationController
  def index
  end

  def new
    @diary = Diary.new
  end

  def create
    binding.pry
    @diary = Diary.create(diary_params)
    if @diary.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def diary_params
    params.require(:diary).permit(:date, :menu, :reflection,).merge(user_id: current_user.id)
  end
end
