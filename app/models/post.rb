class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates_inclusion_of :category, in: %w(Fiction Non-Fiction)
  validate :buzzworthy,
  unless: Proc.new { |a| a.title.blank? }

  def buzzworthy
    buzz_words = ["Won't Believe", "Secret", "Top", "Guess"]
    unless buzz_words.any? {|s| self.title.include? s}
      errors.add(:title, "must be buzzworthy")
    end
  end
end


#a.any? { |s| b.include? s }
