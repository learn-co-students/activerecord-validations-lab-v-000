class PostValidator < ActiveModel::Validator


  def validate(record)
    if record.title
    unless record.title.include?("Won't Believe" || "Secret" || "Top [number]"|| "Guess")
      record.errors[:title] << 'invalid title'
    end
  end
end

end
