require 'test_helper'

class BetterParams::Base::Test < ActiveSupport::TestCase
  test '#prepare_nested_attributes' do
    hash_params = { tags: [{ name: 'Name' }] }
    params = init_params(hash_params)
    new_params = params.prepare_nested_attributes(:tags)

    assert new_params.key?(:tags_attributes)
    assert_not new_params.key?(:tags)
  end
end
