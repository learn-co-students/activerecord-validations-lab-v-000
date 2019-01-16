class Post < ActiveRecord::Base
  
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 250}
  validates :summary, presence: true, length: { maximum: 250}
  validates :category, inclusion: {in: %w(Ficture  Non-Fiction)}

end
