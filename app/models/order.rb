class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :pitch
  validates :date_order, presence: true
  validate :check_date_order_1
  validate :check_date_order, :on => :create
  default_scope -> { order(created_at: :desc) }


  private
  def check_date_order
    #binding.pry
    errors.add(:base, 'can not ') if  overllaping_time
  end

  def overllaping_time
    a = false
    Order.all.each do |order|
      if (time == order.time && date_order == order.date_order && order.status == "actived")
        a = true
      end
    end
    return a
  end

  def check_date_order_1
    errors.add(:base, 'can not order 1') if date_order < Date.today
  end
end
