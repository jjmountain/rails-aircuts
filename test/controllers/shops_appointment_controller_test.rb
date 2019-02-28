require 'test_helper'

class ShopsAppointmentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shops_appointment_index_url
    assert_response :success
  end

  test "should get update" do
    get shops_appointment_update_url
    assert_response :success
  end

  test "should get destroy" do
    get shops_appointment_destroy_url
    assert_response :success
  end

end
