class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: %w(Fiction Non-Fiction) }
    validate :includes_clickbait

    def includes_clickbait
      clickbait = false
      clickbait_array = ["Won't Believe", "Secret", "Guess", "Top \d"]
      if !self.title.nil?
        clickbait_array.each do |clickbait_phrase|
          clickbait = true if self.title.include?(clickbait_phrase)
        end
      end
      errors.add(:base, "title must include clickbait.") if !clickbait
    end
end
