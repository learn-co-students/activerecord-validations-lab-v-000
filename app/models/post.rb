class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_bait
  
  private

  def click_bait
    click_words = ["Won't Believe", "Secret", "Top", "Guess"]
    if self.title == nil
      errors.add(:title, "invalid")
    else
      holder = []
      click_words.each do |word|
        if self.title.include?(word)
          holder << word
        end
      end
      if holder.size == 0
        errors.add(:title, "invalid")
      end
    end
  end
  
end
