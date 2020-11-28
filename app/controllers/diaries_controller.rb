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
    @diary = Diary.find(params[:id])
  end

  def edit
    @diary = Diary.find(params[:id])
    unless current_user == @diary.user
      redirect_to root_path
    end
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to diary_path
    else
      render edit_diary_path
    end
  end
  
  private

  def diary_params
    params.require(:diary).permit(:date, :title, :menu, :reflection,).merge(user_id: current_user.id)
  end
end
