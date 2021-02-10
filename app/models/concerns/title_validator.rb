class TitleValidator < ActiveModel::Validator

  def validate(post)
    clickbait_y(post) unless post.title == nil
  end

  private

  def clickbait_y(post)
    click_bait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    bait_included = []
    click_bait.map do |bait|
      if post.title.include?(bait)
        bait_included << bait
      end
    end
    if bait_included.count == 0
      post.errors.add(:title, "Not clickbait-y enough.")
    end
  end


end
