class Post < ActiveRecord::Base
  attr_accessible :body, :email, :hourly_calls, :total_calls
end
