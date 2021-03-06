class Title < ActiveRecord::Base

  belongs_to :user
  has_many :covers, :dependent => :destroy
  
  validates_presence_of :title
  
end
