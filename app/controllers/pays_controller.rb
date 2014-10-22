class PaysController < ApplicationController

  before_action :authenticate                                   #身份驗證功能

  def index
    @pays = Pay.order("id DESC").page(params[:page]).per(5)     #最新的資料會在最前面 .order("id DESC")
  end                                                           #頁數功能 .page(params[:page]).per(5)

  def new
    @pay = Pay.new
  end

  def create
    @pay = Pay.new(pay_params)

    @pay.status = "not_paid"                                   #預設是not_paid狀態

    if @pay.save
      redirect_to pays_path
    else 
      render :new
    end
  end

  def update
    @pay = Pay.find(params[:id])

    @pay.status = "paid"                                       #update後，是paid狀態
    @pay.save

    redirect_to pays_path( :page => params[:page] )            #頁數的路徑，即使update也不會跑回第一頁
  end

  def destroy
    @pay = Pay.find(params[:id])
    @pay.destroy

    redirect_to pays_path( :page => params[:page] )            #頁數的路徑，即使delete也不會跑回第一頁
  end



  protected

  def authenticate                                                       #身份驗證功能
    authenticate_or_request_with_http_basic do |username, password|
    username == "dachin" && password == "123456789"
    end
  end

  private

  def pay_params
    params.require(:pay).permit(:date,:payer,:money,:description)
  end

end
