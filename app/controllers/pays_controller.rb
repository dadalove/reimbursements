class PaysController < ApplicationController
  def index
    @pays=Pay.all
  end

  def new
    @pay=Pay.new
  end

  def create
    @pay=Pay.new(pay_params)
    if @pay.save
      redirect_to pays_path
    else 
      render :new
    end
  end

  def destroy
    @pay=Pay.find(params[:id])
    @pay.destroy
    redirect_to pays_path
  end







  private

  def pay_params
    params.require(:pay).permit(:date,:payer,:money,:description)
  end

end
