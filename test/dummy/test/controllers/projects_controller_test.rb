require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test 'should post params_add_destroy_info' do
    params = {}
    post add_destroy_info_url, params: params
    assert_response :success
  end

  test 'should post params_booleans' do
    params = {
    }

    post booleans_url, params: params
    assert_response :success
  end

  test 'should post params_datetimes' do
    params = {
    }

    post datetimes_url, params: params
    assert_response :success
  end

  test 'should post params_prepare_nested_attributes' do
    params = {
    }

    post prepare_nested_attributes_url, params: params
    assert_response :success
  end

  test 'should post params_remove_blanks' do
    params = {
    }

    post remove_blanks_url, params: params
    assert_response :success
  end

  test 'should post params_replace_blanks_by_nil' do
    params = {
    }

    post replace_blanks_by_nil_url, params: params
    assert_response :success
  end

  test 'should post params_strip_values' do
    params = {
    }

    post strip_values_url, params: params
    assert_response :success
  end
end
