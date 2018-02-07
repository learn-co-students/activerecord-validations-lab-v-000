class Clickbait < ActiveModel::Validator
  def validate(record)
    re = Regexp.union(/Won't Believe/i, /Secret/i, /Top [0-9]+/i, /Guess/i)

    unless record.title =~ re
      record.errors[:title] << 'Needs more click bait!'
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category , inclusion: {in: %w(Fiction Non-Fiction)}

  include ActiveModel::Validations
  validates_with Clickbait
end
