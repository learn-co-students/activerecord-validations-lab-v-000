class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates_length_of :content, :minimum => 250
  validates_length_of :summary, :maximum => 250
  validates_inclusion_of :category, :in => %w(Fiction Non-Fiction)
  validate :clickbait?

  def clickbait?
      clickbaits = [/Won't Believe/i, /Secret/i, /Top \d+/i, /Guess/i]

      errors.add(:title, :not_clickbait) unless clickbaits.any?{|w| w.match(title) }
  end
end
