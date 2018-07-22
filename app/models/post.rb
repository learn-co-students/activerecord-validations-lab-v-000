class Post < ActiveRecord::Base
  validate :title_has_keywords
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction)}

  def title_has_keywords
    if !title.nil?
      unless ["Won't Believe", "Secret", "Top [number]", "Guess"].any? {|phrase| title.include?(phrase)}
        errors[:title] << 'Need a catcy title please!'
      end
    end
  end
end
