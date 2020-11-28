class DiariesController < ApplicationController
  def index
    @diaries = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.create(diary_params)
    if @diary.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show
  end
  
  private

  def diary_params
    params.require(:diary).permit(:date, :title, :menu, :reflection,).merge(user_id: current_user.id)
  end
end
