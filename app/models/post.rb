class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :is_clickbait?
  validates(:content, { :length => { :minimum => 244 } })
  validates(:summary, { :length => { :maximum => 244 } })
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  #regex quick reference; http://www.zenspider.com/ruby/quickref.html#types
  #http://womanonrails.com/custom-rails-validators
  CLICKBAIT_PATTERNS = [
  /Won't Believe/i,
  /Secret/i,
  /Top [0-9]*/i,
  /Guess/i
]

def is_clickbait?
  if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
    errors.add(:title, "must be clickbait")
  end
end
end
#regex sandbox = https://regexr.com/
#regex tutorial = http://ruby.bastardsbook.com/chapters/regexes/
# Last login: Mon Sep 25 20:46:55 on ttys000
# [21:07:49] ~ $ irb
# 2.4.0 :001 >   CLICKBAIT_PATTERNS = [
# 2.4.0 :002 >         /Won't Believe/i,
# 2.4.0 :003 >         /Secret/i,
# 2.4.0 :004 >         /Top [0-9]*/i,
# 2.4.0 :005 >         /Guess/i
# 2.4.0 :006?>     ]
#  => [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
# 2.4.0 :007 > CLICKBAIT_PATTERNS.none?
#  => false
# 2.4.0 :008 > title = "must be clickbait"
#  => "must be clickbait"
# 2.4.0 :009 > pat = /Won't Believe/i
#  => /Won't Believe/i
# 2.4.0 :010 > pat.match? title
#  => false
# 2.4.0 :011 > pat = /Secret/i
#  => /Secret/i
# 2.4.0 :012 > pat == secret ?
# 2.4.0 :013 >   ?
# 2.4.0 :014 >   pat == secrete
# (irb):13: warning: invalid character syntax; use ?\n
# SyntaxError: (irb):13: syntax error, unexpected '?'
# 	from /Users/charlielee/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
# 2.4.0 :015 > pat == secret
# NameError: undefined local variable or method `secret' for main:Object
# Did you mean?  select
# 	from (irb):15
# 	from /Users/charlielee/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
# 2.4.0 :016 > pat = /Top [0-9]*/i
#  => /Top [0-9]*/i
# 2.4.0 :017 > top 1 == pat
# NoMethodError: undefined method `top' for main:Object
# Did you mean?  tap
# 	from (irb):17
# 	from /Users/charlielee/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
# 2.4.0 :018 > title = must be clickbait
# NameError: undefined local variable or method `clickbait' for main:Object
# 	from (irb):18
# 	from /Users/charlielee/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
# 2.4.0 :019 > title = "must be clickbait"
#  => "must be clickbait"
# 2.4.0 :020 > pat.match? title
#  => false
# 2.4.0 :021 > pat
#  => /Top [0-9]*/i
# 2.4.0 :022 > pat = /Guess/i
#  => /Guess/i
# 2.4.0 :023 > pat
#  => /Guess/i
# 2.4.0 :024 > pat.match? title
#  => false
# 2.4.0 :025 > CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
#  => true
