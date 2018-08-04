class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: %w(Fiction Non-fiction)
  validate :title_must_be_clickbaity

  def title_must_be_clickbaity
    if self.title != nil
      val = !self.title.scan(/Won't Believe|Secret|Guess|Top \d/).empty?
    else 
      val = false
    end

    if !val
      self.errors[:title] << "Must be clikcbaity!"
    end
    val

  end
  
end
