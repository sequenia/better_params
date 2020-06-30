require 'test_helper'

class BetterParams::Base::Test < ActiveSupport::TestCase
  test '#datetimes' do
    hash_params = { start_datetime: Time.now.to_s, end_datetime: Time.now.to_s }
    params = init_params(hash_params)
    new_params = params.datetimes(:start_datetime)

    assert new_params[:start_datetime].is_a? Time
    assert new_params[:end_datetime].is_a? String
  end
end
