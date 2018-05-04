class TitleValidator < ActiveModel::EachValidator
  TITLE_REGEX = /m/

  def validate_each(record, attribute, value)
    if value.match(TITLE_REGEX).blank?
      record.errors.add(:title, "Title must include clickbait-y material")
    end
  end
end
