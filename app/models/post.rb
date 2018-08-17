class Post < ActiveRecord::Base
  
  title - required, must contain one of the following:  "Won't Believe", "Secret", "Top [number]", or "Guess"
  content - minimum 250 characters
  summary - maximum 250 characters
  category - only fiction/non-fiction (use inclusion validator http://guides.rubyonrails.org/active_record_validations.html)
  
end
