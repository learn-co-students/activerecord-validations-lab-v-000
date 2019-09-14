class Post < ActiveRecord::Base

  CLICKBAIT_TITLES = ["Won't Believe", "Secret", "Top[number]", "Guess"]

  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
#implement custom validation
  validate :clickbait #validate not plural

  def clickbait
    #make sure title isnt empty and title does not include any of teh items in the array above
      if !title.nil? && !CLICKBAIT_TITLES.any?{ |t| title.include?(t)}
        errors.add(:title, "must be clickbait")
      end
  end


#below is a second example of a custom validation
#i believe the CLICKBAIT_PATTERNS array uses regex

  #validate :is_clickbait?

  #CLICKBAIT_PATTERNS = [
  #  /Won't Believe/i,
  #  /Secret/i,
  #  /Top [0-9]*/i,
  #  /Guess/i
  #]

  #def is_clickbait?
  #  if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
  #    errors.add(:title, "must be clickbait")
  #  end
  #end

end
