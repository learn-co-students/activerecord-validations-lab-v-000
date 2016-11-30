class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /(Secret|Top|Won't Believe|Guess)/
      record.errors[attribute] << (options[:message] || "Not a valid title")
    end
  end
end

class Post < ActiveRecord::Base

  validates :title, presence: true, title: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 200 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid size" }
end
