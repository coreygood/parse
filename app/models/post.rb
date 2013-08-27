class Post < ActiveRecord::Base
  attr_accessible :body, :email, :attachment
end
