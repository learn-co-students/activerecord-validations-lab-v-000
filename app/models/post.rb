class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary , length: { maximum: 100 }
  # validates :category, presence: true

  validates :category, inclusion: { in: Post.each {|post| post.category }

end
