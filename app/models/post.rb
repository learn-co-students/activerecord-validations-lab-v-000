class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  def invalid?
    unless self.title.include? ("Won't Believe") || self.title.include? ("Secret") || self.title.include? (/Top\s\d*\s/) || self.title.include? ("")
    true
  end

  def invalid?
    ["Won't Believe", "Secret", /Top\s\d*\s/, "Guess"].any? { |keyword| self.title.include? keyword}


end
