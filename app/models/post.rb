
# class FictionValidator < ActiveModel::Validator
#   def validate(record)
#     # binding.pry
#     if record.category != "Non-Fiction" && record.category != "Fiction"
#       record.errors[:category] << "this needs to be Non-Fiction or Fiction"
#     end
#   end
# end
class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction  Non-Fiction)}
  # validates_with FictionValidator
  validate :clickbait

  TITLE_PATTERNS = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def clickbait 
    if TITLE_PATTERNS.none?{ |e| e.match(self.title) } # true or false
      errors.add(:title, "needs to be one of this = Won't Believe - Secret - Top [number] - Guess")
    end
  end
end

