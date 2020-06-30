require 'test_helper'

class BetterParams::Base::Test < ActiveSupport::TestCase
  test '#add_destroy_info for nil object' do
    hash_params = {}
    params = init_params(hash_params)
    new_params = params.add_destroy_info(nil, :tags)

    assert params.eql?(new_params)
  end

  test '#add_destroy_info' do
    # TODO: code
  end
end
