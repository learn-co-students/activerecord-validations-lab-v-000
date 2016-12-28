class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  class MyValidator < ActiveModel::Validator
    def validate(record)
      unless record.title =~ /Won't Believe|Secret|Guess|Top [0-9]/i
        record.errors[:name] << "Not a valid title"
      end
    end
  end

  include ActiveModel::Validations
  validates_with MyValidator

end