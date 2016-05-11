class Post < ActiveRecord::Base
  validates   :title, length: {minimum: 12}
  validates   :content, length: {in: 15...400}
  validates   :summary, length: {in: 2...20}
  validates   :category, inclusion: {in: %w(Fiction)}
end
