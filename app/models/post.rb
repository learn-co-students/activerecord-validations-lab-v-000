class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title_validator

  def title_validator
    if title.present?
      words = title.split
      number = words[1].to_i
      if !title.include? "Won't Believe"
        if !title.include? "Secret"
          if !title.include? "Guess"
            if !title.include? "Top"
              errors.add(:title, "Title must be clickbait")
            elsif number == 0
              errors.add(:title, "Title must be clickbait")
            end
          end
        end
      end
    end
  end

end
