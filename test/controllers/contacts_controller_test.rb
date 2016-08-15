require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get controller" do
    get contacts_controller_url
    assert_response :success
  end

end
