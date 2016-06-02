class Event < ActiveRecord::Base

  has_many :users, through: :favorites

end
