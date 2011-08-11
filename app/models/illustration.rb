class Illustration < ActiveRecord::Base

  belongs_to :user
  has_many :covers
  
  has_attached_file :illustration,
    :styles => {
      :thumb => '100x100#',
      :large => '600x400#',
    }

end  
