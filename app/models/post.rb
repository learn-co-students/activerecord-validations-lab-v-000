class Post < ActiveRecord::Base
  @@categories = ["Fiction"]
  @@clickbait = ["True Facts"]

  validates :title, presence: true, exclusion: {in: @@clickbait}
  validates :content, length: {minimum: 50}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: @@categories}


end
