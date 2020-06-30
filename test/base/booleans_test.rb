require 'test_helper'

class BetterParams::Base::Test < ActiveSupport::TestCase
  test '#booleans' do
    hash_params = { is_active: 'true', is_show: 'false' }
    params = init_params(hash_params)
    new_params = params.booleans(:is_active)

    assert new_params[:is_active].is_a? TrueClass
    assert new_params[:is_show].is_a? String
  end
end
