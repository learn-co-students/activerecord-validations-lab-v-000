class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }


  def validate(record)
    unless record.title.include?("Won't Believe", "Secret", "Guess")
      record.errors[:name] << "Not a valid title"
    end
  end
end
