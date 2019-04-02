require 'test_helper'

class ProprietorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get proprietors_index_url
    assert_response :success
  end

  test "should get new" do
    get proprietors_new_url
    assert_response :success
  end

  test "should get show" do
    get proprietors_show_url
    assert_response :success
  end

  test "should get create" do
    get proprietors_create_url
    assert_response :success
  end

  test "should get edit" do
    get proprietors_edit_url
    assert_response :success
  end

  test "should get update" do
    get proprietors_update_url
    assert_response :success
  end

  test "should get destroy" do
    get proprietors_destroy_url
    assert_response :success
  end

end
