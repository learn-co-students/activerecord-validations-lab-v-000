class Clickbait < ActiveModel::Validator
  def validate(x)
        unless x.title.nil?
            unless x.title.index(/(Won't Believe)|(Guess)|(Secret)|(Top \d+)/)
                x.errors[:title] << 'needs more clickbait'
            end
        end
  end
end

class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates_with Clickbait
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
end
