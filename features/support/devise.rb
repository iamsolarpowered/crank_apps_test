Devise::OmniAuth.test_mode!

Before do
  Devise::OmniAuth.short_circuit_authorizers!
  Devise::OmniAuth.stub!(:facebook) do |b|
    b.post('/oauth/access_token') do
      [200, {}, { :access_token => 'facebook_access_token' }.to_json]
    end
    b.get('/me?access_token=facebook_access_token') do
      [
        200, {},
        {
          :id => '1234567',
          :link => 'http://facebook.com/jsmith',
          :email => 'jsmith@example.com',
          :name => 'Joe Smith',
          :first_name => 'Joe',
          :last_name => 'Smith',
          :website => 'http://example.com/users/jsmith',
          :bio => 'I am awesome!!!'
        }.to_json
      ]
    end
  end
end

After do
  Devise::OmniAuth.unshort_circuit_authorizers!
  Devise::OmniAuth.reset_stubs!
end
