class User < ActiveRecord::Base

	has_secure_password

	has_many:requests, foreign_key: "acceptor_id"

	has_many:donations, foreign_key: "donator_id"

	has_many:donated_requests, through: :donations, foreign_key: "donator_id", source: :requests













end

# u=User.new
# u.name='vx'
# u.email='vx@vx.com'
# u.password='vx'
