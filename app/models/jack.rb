class Jack < ActiveRecord::Base
  belongs_to :queen
  has_one    :ten
end
