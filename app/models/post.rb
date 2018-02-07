class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait


  def clickbait
    clickbait_words = ["Won't Believe", "Secret", "Top", "Guess"]
    if title != nil
        if clickbait_words.none? { |word| title.include? word }
              errors.add(:title, "must be clickbait-y")
        end
      end

    # if title != nil
    #   if !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Top") && !title.include?("Guess")
    #     errors.add(:title, "must be clickbait-y")
    #   end
    # end
  end

end
