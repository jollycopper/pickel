class Course < ActiveRecord::Base
  enum term: [:fall, :spring, :summer, :winter]
end
