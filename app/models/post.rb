class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_bait

  def click_bait
    if self.title
      if self.title.include?("You Won't") || self.title.include?("Guess") || self.title.include?("Top") || self.title.include?("Secret")
        true
      else  
        false
      end
    end
  end


end
