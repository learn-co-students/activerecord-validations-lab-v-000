class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbaity?

    ARR = ["Won't Believe", "Top", "Secret", "Guess"]

    def is_clickbaity?
        if !ARR.any? { |w| self.title =~ /#{w}/ }
            errors.add(:title, "make it more clickbaity!")
        end
    end
end
