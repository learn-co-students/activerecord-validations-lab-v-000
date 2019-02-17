class Post < ActiveRecord::Base
  # include ActiveModel::Validations
  # validates_with MyValidator

    validates :title, presence: true
    validates :content, length: {minimum: 250 }
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbaity_title


    def clickbaity_title
      clickbaity_words = ["Won't Believe", "Secret", "Top", "Guess"]
      if self.title
        unless clickbaity_words.any? {|word| self.title.include?(word)}
          errors.add(:title, "must be clickbaity")
        end
      end
    end
end
