# frozen_string_literal: true

require 'test_helper'

class AppointementTenantControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get appointement_tenant_index_url
    assert_response :success
  end

  test 'should get show' do
    get appointement_tenant_show_url
    assert_response :success
  end

  test 'should get new' do
    get appointement_tenant_new_url
    assert_response :success
  end

  test 'should get edit' do
    get appointement_tenant_edit_url
    assert_response :success
  end
end
