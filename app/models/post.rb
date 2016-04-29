class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title, :check_clickbait
   def check_clickbait
     if @title = self.title
       if !["Won't Believe", "Secret", "Top [number]", "Guess"].any? {|word| @title.include?(word)}
         errors.add(:title, "This is Clickbait")
       end
     end
   end

end
