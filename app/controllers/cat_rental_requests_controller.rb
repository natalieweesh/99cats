class CatRentalRequestsController < ApplicationController

  def new
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(params[:cat_rental_request])
    if @cat_rental_request.save
      redirect_to cat_rental_request_url(@cat_rental_request)
    else
      render :new
    end
  end

  def show
    @cat_rental_request = CatRentalRequest.find(params[:id])
    render :show
  end

  def update
    @request = CatRentalRequest.find(params[:id])
    if params[:cat_rental_request][:status] ==  "deny"
      @request.deny
    else
      @request.approve
    end
    redirect_to cat_url(@request.cat.id)
  end
end
