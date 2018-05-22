class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_bait

 def clickbaity 
   return false if title == nil     unless ["Won't Believe", "Secret", "Guess"].any? {|cb| title.match(cb)} || self.title.match(/Top \d*/)       errors.add(:title, "title is not clickbaity enough")     end 	end

  def click_bait
    if self.title
      if self.title.include?("Won't Believe") || self.title.include?("Guess") || self.title.include?("Top") || self.title.include?("Secret")
        true
      else
        errors.add(:title, "wrong")
        false
      end
    end
  end


end
