require 'test_helper'

class BetterParams::Base::Test < ActiveSupport::TestCase
  test '#replace_blanks_by_nil' do
    hash_params = { first_name: '', last_name: '' }
    params = init_params(hash_params)
    new_params = params.replace_blanks_by_nil(:first_name)

    assert new_params.key?(:first_name)
    assert new_params[:first_name].nil?
    assert_not new_params[:last_name].nil?
  end
end
