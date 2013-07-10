class CatsController < ApplicationController
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

  end

end
