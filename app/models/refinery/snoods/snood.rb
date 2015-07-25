module Refinery
  module Snoods
    class Snood < Refinery::Core::BaseModel
      self.table_name = 'refinery_snoods'

      validates :email, :presence => true, :uniqueness => true
      #validates :email, presence: { message: "Email is required" }
      
    end
  end
end
