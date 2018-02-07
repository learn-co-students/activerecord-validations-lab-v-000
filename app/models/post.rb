class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { :minimum => 250 }
    validates :summary, length: { :maximum => 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbait? # note the singular validate

    

    CLICKBAIT_PATTERNS = [ 
        /Won't Believe/i,
        /Secret/i,
        /Guess/i,
        /Top [0-9]*/i
    ]

    def is_clickbait?
        if CLICKBAIT_PATTERNS.none? {|pat| pat.match title}
            errors.add(:title, "must include clickbait")
        end 
    end
end
