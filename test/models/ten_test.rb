require 'test_helper'

class TenTest < ActiveSupport::TestCase
  setup do
    @king = King.create
    @queen = Queen.create(king: @king)
    @jack = Jack.create(queen: @queen)
  end

  test "_without a callback, king should be referrable" do
    ten = Ten.create(jack: @jack)
    assert ten.king == @king
  end

  test "with a before save callback, king should be nil" do
    Ten.before_save(:refer_to_king)
    ten = Ten.create(jack: @jack)
    assert ten.king == nil
    assert ten.king_reference == nil
    assert ten.indirectly_the_real_king == @king
    Ten.skip_callback(:save, :before, :refer_to_king)
  end

  test "with an after save callback, king should not be nil" do
    Ten.after_save(:refer_to_king)
    ten = Ten.create(jack: @jack)
    assert ten.king == @king
    Ten.skip_callback(:save, :after, :refer_to_king)
  end
end
