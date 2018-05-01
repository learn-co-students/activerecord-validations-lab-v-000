class Post < ActiveRecord::Base

  # validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  valid_categories = ['Fiction', 'Non-Fiction']
  validates_inclusion_of :category, :in => valid_categories
  validate :valid_title


  def valid_title
    title_string = self.title
    if !title_string.downcase.include?("won't believe") || !title_string.include?("secret") || !title_string.include?(":top [number]") || !title_string.include?("guess")
      errors.add(:title, "Must include a clickbait-y phrase")
    end
  end


end


# ["Won't Believe", "Secret", "Top [number]", "Guess"]
# validate :expiration_date_cannot_be_in_the_past,
#     :discount_cannot_be_greater_than_total_value
#
#   def expiration_date_cannot_be_in_the_past
#     if !expiration_date.blank? and expiration_date < Date.today
#       errors.add(:expiration_date, "can't be in the past")
#     end
#   end
#
#   def discount_cannot_be_greater_than_total_value
#     if discount > total_value
#       errors.add(:discount, "can't be greater than total value")
#     end
#   end
