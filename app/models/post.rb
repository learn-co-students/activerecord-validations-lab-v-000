class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :title, format: { with: /(won't believe)|(secret)|(guess)|(top\s\d)/i }
  validates(:content, { :length => { :minimum => 250 } })
  validates(:summary, { :length => { :maximum => 250 } })
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end
