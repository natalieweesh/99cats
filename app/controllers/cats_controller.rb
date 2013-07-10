class CatsController < ApplicationController

  before_filter :current_user

  def index
    @all_cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new()
    render :new
  end

  def create
    @cat = Cat.new(params[:cat])
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    if @current_user.id == @cat.user_id
      render :edit
    else
      render :text => "Can't edit someone else's cat!"
    end
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update_attributes(params[:cat])
    redirect_to cat_url(@cat)
  end

end
