require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Nonfiction) }
  validate :clickbait


  def clickbait
    # binding.pry
    if self.title
      if !(self.title.include?("Won't Believe") || self.title.include?( "Secret") || self.title.include?("Top [number]") || self.title.include?("Guess"))
        errors.add(:title, "not clickbate")
      end
    end
  end
end
