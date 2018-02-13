class Post < ActiveRecord::Base

  CLICKBAIT_TITLES = ["Won't Believe", "Secret", "Top[number]", "Guess"]

  validates :title, presence: true
  validates :content, length: { minimum: 10}
  validates :summary, length: { maximum: 100  }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
#implement custom validation
  validate :clickbait #validate not plural

  def clickbait
    #make sure title isnt empty and title does not include any of teh items in the array above
      if !title.nil? && !CLICKBAIT_TITLES.any?{ |t| title.include?(t)}
        errors.add(:title, "must be clickbait")
      end
  end

end
