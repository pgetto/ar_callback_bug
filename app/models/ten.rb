class Ten < ActiveRecord::Base
  belongs_to :jack
  has_one :queen, through: :jack
  has_one :king, through: :queen


  def refer_to_king
    puts "   jack:            #{jack.try(:id) || '*** Error: nil ***'}"
    puts "   jack.queen:      #{jack.try(:queen).try(:id) || '*** Error: nil ***'}"
    puts "   queen:           #{queen.try(:id) || '*** Error: nil ***'}"
    puts "   jack.queen.king: #{jack.try(:queen).try(:king).try(:id) || '*** Error: nil ***'}"
    puts "   queen.king:      #{queen.try(:king).try(:id) || '*** Error: nil ***'}"
    puts "   king:            #{king.try(:id) || '*** Error: nil ***'}"
    puts ""

    true
  end

  def king_reference
    king
  end

  def indirectly_the_real_king
    jack.queen.king
  end
end
