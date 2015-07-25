require 'spec_helper'

module Refinery
  module Snoods
    describe Snood do
      describe "validations", type: :model do
        subject do
          FactoryGirl.create(:snood,
          :first_name => "Refinery CMS", :email => "tef@poe.com")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:first_name) { should == "Refinery CMS" }
      end
    end
  end
end
