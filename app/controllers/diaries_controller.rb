class DiariesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @diaries = Diary.includes(:user).order('created_at DESC')
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
    @comment = Comment.new
    @comments = @diary.comments.includes(:user)
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
  
  def destroy
    diary = Diary.find(params[:id])
    diary.destroy
    redirect_to root_path
  end

  private

  def diary_params
    params.require(:diary).permit(:date, :title, :menu, :reflection,).merge(user_id: current_user.id)
  end
end
