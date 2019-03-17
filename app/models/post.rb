class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    validate :post_title_includes

    private

    def post_title_includes
        if title.valid? == 'true'
            unless title.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
                errors.add(:title, "false")
            end
        else
            errors.add(:title, "false")
        end
        end
    end
end
