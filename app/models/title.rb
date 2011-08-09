class Title < ActiveRecord::Base

  belongs_to :user
  has_many :covers
  
end
