class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in:[ "Fiction" ,"Non-Fiction"] }
    validate  :clickbait


    CLICKABAITABLE = [/Won't Believe/, /Secret/,/Guess/]


    def clickbait
      unless self.title == nil
      if CLICKABAITABLE.collect{ |reg| self.title.match(reg) }.compact.empty?
        errors[:title] << "Must be clickbait"
      end
      end
    end
end
