class Request < ActiveRecord::Base
belongs_to:user
has_many:donate
has_many:donations

end