require 'test_helper'

class BetterParams::Base::Test < ActiveSupport::TestCase
  test '#remove_blanks' do
    hash_params = { first_name: 'First Name', last_name: '' }
    params = init_params(hash_params)
    new_params = params.remove_blanks

    assert new_params.key?(:first_name)
    assert_not new_params.key?(:last_name)
  end
end
