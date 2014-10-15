class PaysController < ApplicationController
  def index
    @pays=Pay.all
    @pays = Pay.page(params[:page]).per(5)
  end

  def new
    @pay=Pay.new
  end

  def create
    @pay=Pay.new(pay_params)
    @pay.status = "false"
    if @pay.save
      redirect_to pays_path
    else 
      render :new
    end
  end

  # def show
  #   @paid=Paid.find(params[:id])
  # end

  def destroy
    @pay=Pay.find(params[:id])
    @pay.destroy
    redirect_to pays_path
  end

   def update
    @pay=Pay.find(params[:id])
    @pay.status = "true"
    @pay.save
    redirect_to pays_path
  end







  private

  def pay_params
    params.require(:pay).permit(:date,:payer,:money,:description)
  end

end
