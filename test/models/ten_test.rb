require 'test_helper'

class TenTest < ActiveSupport::TestCase
  setup do
    @king = King.create
    @queen = Queen.create(king: @king)
    @jack = Jack.create(queen: @queen)
  end

  test "without a callback, king should be referrable" do
    puts "No callbacks"

    ten = Ten.create(jack: @jack)

    assert ten.king == @king
    assert ten.king_reference == @king
    assert ten.indirectly_the_real_king == @king
  end

  test "with a before save callback, king should be nil" do
    puts "With before save callback"

    Ten.before_save(:refer_to_king)
    ten = Ten.create(jack: @jack)
    Ten.skip_callback(:save, :before, :refer_to_king)

    assert ten.king == nil
    assert ten.king_reference == nil
    assert ten.indirectly_the_real_king == @king

    ten.reload
    assert ten.king == @king
    assert ten.king_reference == @king
    assert ten.indirectly_the_real_king == @king
  end

  test "with an after save callback, king should not be nil" do
    puts "With after save callback"

    Ten.after_save(:refer_to_king)
    ten = Ten.create(jack: @jack)
    Ten.skip_callback(:save, :after, :refer_to_king)

    assert ten.king == @king
    assert ten.king_reference == @king
    assert ten.indirectly_the_real_king == @king
  end
end
