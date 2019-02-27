class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  validate :title_must_be_clickbaity

    def title_must_be_clickbaity
      if !title.nil? && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
        errors.add(:click_bait, "Title must be click_baity")
      end
    end

end
