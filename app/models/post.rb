class MyValidator < ActiveModel::Validator
  def validate(record)
    @record = record
    flag = 0
    bait = ["Won't Believe", "Secret", "Top", "Guess"]
    for word in bait
      if @record.title && @record.title.include?(word)
        flag = 1
      end
    end
      @record.errors[:title] << 'wrong stuff' if flag == 0
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { :in => %w(Fiction Non-Fiction) }
  validates_with MyValidator
end
