module Refinery
  module Snoods
    class Snood < Refinery::Core::BaseModel
      self.table_name = 'refinery_snoods'

      validates :email, :presence => true

    end
  end
end
