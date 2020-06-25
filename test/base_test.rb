require 'test_helper'

class BetterParams::Base::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, BetterParams::Base
  end
end
