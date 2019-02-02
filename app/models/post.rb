require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: { maximum: 250 }
  validates :content, length: { minimum: 250 }
  validates :category, inclusion: {in: ["Non-Fiction", "Fiction"] }

  validate :clickbaity_title

  def clickbaity_title
    #binding.pry

    if title != nil

      if !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Guess") && !title.include?("Top")
        errors.add(:title, "The title isn't clickbaity")
      end

    end


    #if title.scan("Won't Believe")[0] != "Won't Believe" && title.scan("Secret")[0] != "Secret" && title.scan("Guess")[0] != "Guess"
    #  errors.add(:title, 'has to have clickbait')
    #end
  end

end
