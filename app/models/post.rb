class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {within: ["Fiction","Non-Fiction"]}
  validates_each :title do |record,attribute,value|
    record.errors.add(attribute,'must be clickbait-y') unless value =~ /(Won't Believe|Secret|Top \d+|Guess)/
  end
end
