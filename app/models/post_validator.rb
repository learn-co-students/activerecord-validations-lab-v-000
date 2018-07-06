class PostValidator < ActiveRecord::Validator

  def validate(record)
    unless !!record.title && record.tilte.include?("Won't Believe")
      record.errors[:title] << "your title does not contain enough clickbait"
    end
  end
end
