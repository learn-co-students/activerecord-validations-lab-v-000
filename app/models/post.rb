class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  # class MyValidator < ActiveModel::Validator
    def clickbait
      baits = ["Won't Believe", "Secret", "Top", "Guess"]
      if self.title
        if !baits.any? do |bait|
          # binding.pry
            self.title.include?(bait)
          end
          errors.add(:title, "must be clickbait")
        end
      end
    end
  # end

end

#
# class MyValidator < ActiveModel::Validator
#   def validate(record)
#     baits = ["Won't Believe", "Secret", "Top [number]", "Guess"]
#     unless baits.include?(record.title)
#       record.errors[:title] << "Need a title with a clickbaity title please!"
#     end
#   end
# end
