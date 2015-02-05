class Queen < ActiveRecord::Base
  belongs_to :king
  has_one    :jack
end
