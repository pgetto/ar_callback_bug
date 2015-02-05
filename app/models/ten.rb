class Ten < ActiveRecord::Base
  belongs_to :jack
  has_one :queen, through: :jack
  has_one :king, through: :queen


  def refer_to_king
    puts "   **** Error: King is nil ****" if king.nil?
    true
  end

  def king_reference
    king
  end

  def indirectly_the_real_king
    jack.queen.king
  end
end
