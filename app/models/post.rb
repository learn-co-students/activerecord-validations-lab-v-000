
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
  #validates_with FictionValidator
    validate :clickbait

    TITLE_PATTERNS = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def clickbait 
    if TITLE_PATTERNS.none?{ |e| e.match(self.title) } # true or false
      errors.add(:title, "needs to be one of this = Won't Believe - Secret - Top [number] - Guess")
    end
  end
end

# /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# class Invoice < ApplicationRecord
#   validate :expiration_date_cannot_be_in_the_past,
#     :discount_cannot_be_greater_than_total_value

#   def expiration_date_cannot_be_in_the_past
#     if expiration_date.present? && expiration_date < Date.today
#       errors.add(:expiration_date, "can't be in the past")
#     end
#   end

#   def discount_cannot_be_greater_than_total_value
#     if discount > total_value
#       errors.add(:discount, "can't be greater than total value")
#     end
#   end
# end
# CUSTOM VALIDATIONS
# Finally, add a custom validator to Post that ensures the title is sufficiently clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", the validator should return false.

# For future projects, it's a good idea to skim the list of available validation options. It will give you a sense of what's available and help with creating validations for your own model objects.
