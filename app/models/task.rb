class Task < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :duration, :start
end
