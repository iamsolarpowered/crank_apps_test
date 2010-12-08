require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "name is populated from Facebook" do
    assert_equal user.name, 'Joe Smith'
  end
  
  test "email is populated from Facebook" do
    assert_equal user.email, 'joe@test.com'
  end
  
  test "bio is populated from Facebook" do
    assert_equal user.bio, 'I am awesome!!!'
  end
  
  test "uid is populated from Facebook" do
    assert_equal user.facebook_uid, '1234567'
  end
  
  def user
    @user = User.find_for_facebook_oauth(facebook_hash)
  end
  
  def facebook_hash
    {
      'extra' => {
        'user_hash' => {
          'name' => 'Joe Smith',
          'email' => 'joe@test.com',
          'id' => '1234567',
          'bio' => 'I am awesome!!!'
        }
      }
    }    
  end
end
