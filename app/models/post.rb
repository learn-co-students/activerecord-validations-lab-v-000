class Post < ActiveRecord::Base
  validates :title, presence: true, title: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), 
    message: "must be Fiction or Non-Fiction" }
end
