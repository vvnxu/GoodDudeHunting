class User < ActiveRecord::Base

	has_secure_password

	has_many:donates 

	has_many:requests













end

# u=User.new
# u.name='vx'
# u.email='vx@vx.com'
# u.password='vx'
