class Post < ActiveRecord::Base

 validates :title, presence: true
 validates :content, length: { minimum: 250 }
 validates :summary, length: { maximum: 250 }
 validates :category, inclusion: { in: %w(Fiction Nonfiction) }
 include ActiveModel::Validations
 validates_with ClickbaitValidator

end


 # validates :clickbait, presence: true, on: :new

 # validates :email, presence: true, email: true


def clickbait
  unless self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top [number]") || self.title.include?("Guess")
    errors.add(:title, "not clickbaity enough")
  end 
end