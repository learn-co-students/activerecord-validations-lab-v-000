require 'pry'

class Post < ActiveRecord::Base
  def clickbaity?
    clicky = ["Won't Believe", "Secret", "Top
    [number]", "Guess"]

    unless !self.title.nil? && clicky.any? {|word| self.title.include?(word)}
      errors[:title] << 'Title not Clickbaity Enough'
    end 
  end

  validates :title, presence: true
  validate :clickbaity?
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end