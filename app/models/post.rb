class ClickBaitValidator < ActiveModel::Validator
  def validate(record)
    unless record.title =~ /won't believe|secret|top \d+|guess/i
      record.errors[:title] << 'Need a clickbaity link'
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 299 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), 
    message: "%{value} is not a valid category" }
  validates_with ClickBaitValidator

end
