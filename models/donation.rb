class Donation < ActiveRecord::Base

belongs_to:user, foreign_key: "donator_id"
belongs_to:request


end