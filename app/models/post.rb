class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless !value || value.downcase =~ /won't believe|secret|guess|top \d+/
      record.errors[attribute] << false
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true, title: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end
