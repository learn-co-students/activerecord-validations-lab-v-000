class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { in: 10...200 }
    validates :summary, length: { maximum: 250 } 
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end
