class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: %w(Fiction Non-fiction)
  validate :title_must_be_clickbaity

  def title_must_be_clickbaity
    if self.title != nil
      result = !self.title.scan(/Won't Believe|Secret|Guess|Top \d/).empty?
    else 
      result = false
    end
    result
  end
  
end
