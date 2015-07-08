module Refinery
  module Snoods
  class CourtesyMailer < ActionMailer::Base
    default from: "name@example.com"
    def thanx_email(snood)
        @prospect = snood
        @url  = 'http://example.com/login'
        mail(to: @prospect.email, subject: 'Your Download Request is On Its Way!')
      end
    end
  end
end
