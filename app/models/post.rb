class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length 250 min
  validates :summary, length 250 max
  validates :category fiction or non (inclusion)
end
