class MyValidator < ActiveModel::Validator
  def validate(record)
    if !record.title.nil?
        unless record.title.downcase.include?("won't believe") || record.title.include?("/top\s\d+/") || record.title.include?("secret") || record.title.include?("guess")
            record.errors[:title] << 'Not Clickbait'
        end
    end
    end
end

class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validates_with MyValidator

    #def click_bait?
    #    @post = Post.find(params[id])
    #    @post.title.downcase.include?("won't believe") || @post.downcase.include?(/top\s\d+/) || @post.downcase.include?("secret") || @post.downcase.include?("guess")
    #end


    #def click_bait
    #    self.downcase.include?("won't believe") || self.downcase.include?(/top\s\d+/) || self.downcase.include?("secret") || self.downcase.include?("guess")
    #end
end
