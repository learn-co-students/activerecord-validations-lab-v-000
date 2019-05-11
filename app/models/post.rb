class Post < ActiveRecord::Base
  validates :title, :presence => true
  validate  :title_is_clickbait
  validates :content, :length => {:minimum => 250}
  validates :summary, :length => {:maximum => 250}
  validates :category, :inclusion => {:in => ['Fiction', 'Non-Fiction']}
  
  def title_is_clickbait
    clickbait = [/Won't Believe/, /Secret/, /Top/, /Guess/]
    if !clickbait.any?{|regexp| !!regexp.match(title)}
      errors.add(:title, "must be sufficiently clickbait-y")
    end
  end
end
