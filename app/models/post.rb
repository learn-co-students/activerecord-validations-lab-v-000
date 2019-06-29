class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  # validates :category, inclusion: { in: %w(fiction non-fiction), message: "%{value} is not the right category" }
  # validates :size, inclusion: { in: %w(small medium large),
  #  message: "%{value} is not a valid size" }
  validate :is_clickbait?
  
  CLICKBAIT_ARR = [
    /Guess/,
    /Secret/,
    /Top [0-9]*/,
    /Won't Believe/
  ]
  
  def is_clickbait?
    # "hello".include? "lo"   #=> true
    # "hello".include? "ol"   #=> false
    # "hello".include? ?h     #=> true
    # bool_value = false
    # if !title.nil? && (title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess"))
    #   bool_value = true
    # elsif title.nil?
    #   bool_value = true
    # end
    # bool_value
    

    # it "is invalid if not clickbait" do
    #   expect(non_clickbait).to be_invalid
    # end
    
    # CLICKBAIT_ARR.none? { |clickbait| clickbait.match title }
    if CLICKBAIT_ARR.none? { |clickbait| clickbait.match title }
      errors.add(:title, "No clicks, no ad money, no go")
    end
  end

end