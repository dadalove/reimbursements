class PaysController < ApplicationController

  def index
    @pays = Pay.order("id DESC").page(params[:page]).per(5)
  end

  def new
    @pay = Pay.new
  end

  def create
    @pay = Pay.new(pay_params)

    @pay.status = "not_paid"

    if @pay.save
      redirect_to pays_path
    else 
      render :new
    end
  end

  def update
    @pay = Pay.find(params[:id])

    @pay.status = "paid"
    @pay.save

    redirect_to pays_path( :page => params[:page] )
  end

  def destroy
    @pay = Pay.find(params[:id])
    @pay.destroy

    redirect_to pays_path( :page => params[:page] )
  end

  private

  def pay_params
    params.require(:pay).permit(:date,:payer,:money,:description)
  end

end
