require 'test_helper'

class BetterParams::Base::Test < ActiveSupport::TestCase
  test '#booleans for true' do
    hash_params = { is_active: true }
    params = init_params(hash_params)
    new_params = params.booleans(:is_active)

    assert new_params[:is_active].is_a? TrueClass
  end

  test '#booleans for "true"' do
    hash_params = { is_active: 'true' }
    params = init_params(hash_params)
    new_params = params.booleans(:is_active)

    assert new_params[:is_active].is_a? TrueClass
  end

  test '#booleans for "1"' do
    hash_params = { is_active: '1' }
    params = init_params(hash_params)
    new_params = params.booleans(:is_active)

    assert new_params[:is_active].is_a? TrueClass
  end

  test '#booleans for false' do
    hash_params = { is_active: false }
    params = init_params(hash_params)
    new_params = params.booleans(:is_active)

    assert new_params[:is_active].is_a? FalseClass
  end

  test '#booleans for "false"' do
    hash_params = { is_active: 'false' }
    params = init_params(hash_params)
    new_params = params.booleans(:is_active)

    assert new_params[:is_active].is_a? FalseClass
  end

  test '#booleans for "0"' do
    hash_params = { is_active: '0' }
    params = init_params(hash_params)
    new_params = params.booleans(:is_active)

    assert new_params[:is_active].is_a? FalseClass
  end

  test '#booleans for nil' do
    hash_params = { is_active: nil }
    params = init_params(hash_params)
    new_params = params.booleans(:is_active)

    assert new_params[:is_active].is_a? NilClass
  end

  test '#booleans for not bool' do
    hash_params = { is_active: 'not_bool' }
    params = init_params(hash_params)
    new_params = params.booleans(:is_active)

    assert new_params[:is_active].is_a? NilClass
  end

  test '#booleans without booleans' do
    hash_params = { is_active: 'true', is_show: 'true' }
    params = init_params(hash_params)
    new_params = params.booleans(:is_active)

    assert new_params[:is_active].is_a? TrueClass
    assert new_params[:is_show].is_a? String
  end
end
