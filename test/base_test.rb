require 'test_helper'

class BetterParams::Base::Test < ActiveSupport::TestCase
  def init_params(hash_params)
    ActionController::Parameters.new(hash_params).permit(allowed_params)
  end

  def allowed_params
    [
      :first_name,
      :last_name,
      :start_datetime,
      :end_datetime,
      :is_active,
      :is_show,
      tags: [:id, :name]
    ]
  end

  test 'existence of the Base module' do
    assert_kind_of Module, BetterParams::Base
  end
end
