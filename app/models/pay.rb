class Pay < ActiveRecord::Base

  validates :date, :money, presence: true
  validates :money, numericality: {only_integer: true, greater_than: 0}


  def is_paid?
    status == "paid"
  end

end
