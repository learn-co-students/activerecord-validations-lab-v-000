class TitleValidator < ActiveModel::Validator

  # def validate(record)
  #   ["Won't Believe", "Secret", "Top [number]", "Guess"].each do |word|
  #     unless record.title.include?(word)
  #       record.errors[:title] << "Needs to be click-bait-y yo!"
  #     end
  #   end
  # end

  def validate(record)
    clickbait = ["Won't", "Believe", "Secret", "Top", "Guess"]
    unless record.title.split.select { |word| clickbait.include?(word) }
      record.errors[:title] << "Include some clickbait in your title"
    end

      # clickbait = ["Won't", "Believe", "Secret", "Top", "Guess"]
      # unless record.title.split.select { |word| clickbait.include?(word) }
        # record.errors[:title] << "Include some clickbait in your title"
      # end
    # end
  end

end
