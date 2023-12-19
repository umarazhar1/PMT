require 'test_helper'

class BugTest < ActiveSupport::TestCase

  def setup
    @bug = Bug.new(name: "Sports")
  end

  test "bug should be valid" do
    # @bug = Bug.new(name: "Sports")
    assert @bug.valid?
  end
  
  test "name should be present" do
    @bug.title = " "
    assert_not @bug.valid?
  end

  test "name should be unique" do
    @bug.save
    @bug2 = Bug.new(title: "Sports")
    assert_not @bug2.valid?
  end

  test "name should not be too long" do
    @bug.title = "a" * 26
    assert_not @bug.valid?
  end

  test "name should not be too short" do
    @bug.title = "aa"
    assert_not @bug.valid?
  end



end