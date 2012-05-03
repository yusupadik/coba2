class Country < ActiveRecord::Base
  belongs_to :user
  
  validates :code, :presence => true,
                   :format => {:with => /[a-zA-Z\s]+$/}
  validate :valid_code
  validates :name, :presence => true,
                   :length => {:minimum =>1, :maximum => 15},
                        :format => {:with => /[a-zA-Z\s]+$/}


  def valid_code
    self.errors[:code] << "Hanya boleh menggunakan code 'id', 'usa' dan 'frc'" unless code =="id" or code =="usa" or code =="frc"
  end

end
