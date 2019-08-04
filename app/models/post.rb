class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_must_be_click_bait


    def title_must_be_click_bait
        arr = ["Won't Believe", "Secret", "Top /[0-9]/", "Guess"]
        if title.present? && !arr.any? {|kw| title.include?(kw)}
            errors.add(:title, "must be click bait")
        end
    end
end
