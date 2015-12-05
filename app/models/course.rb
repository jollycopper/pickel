class Course < ActiveRecord::Base
  enum term: [:fall, :spring, :summer, :winter]
  has_many :selections, dependent: :destroy
end
