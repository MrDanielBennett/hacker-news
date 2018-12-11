class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :points, :presence => true
end
