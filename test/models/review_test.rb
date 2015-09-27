require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @review = Review.new(rating: "5", comment: "Really awesome movie")
  end

  test "rating should be present" do
    @review.rating = "  "
    assert_not @review.valid?
  end

  test "comment should be present" do
    @review.comment = "   "
    assert_not @review.valid?
  end
end
