require 'test_helper'

class BetterParams::Base::Test < ActiveSupport::TestCase
  test '#strip_values' do
    hash_params = { first_name: ' First Name ', last_name: ' First Name ' }
    params = init_params(hash_params)
    new_params = params.strip_values(:first_name)

    assert new_params[:first_name] = 'First Name'
    assert new_params[:last_name] = ' First Name '
  end
end
