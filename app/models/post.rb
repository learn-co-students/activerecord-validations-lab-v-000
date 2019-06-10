class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, acceptance: {  accept: "Fiction" || "Non-Fiction"}
    validates :title, exclusion: { in: %w(Blah)}


end
