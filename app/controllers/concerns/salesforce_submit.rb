module SalesforceSubmit
  SALESFORCE_PATH = "https://www.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8"
  
  def web_to_lead()
 
    require "uri"
    require "net/http"
    
    
    
  
    #logger.debug "Prospect attributes hash: #{@snood.attributes.inspect}"
    x = Net::HTTP.post_form(URI.parse(SALESFORCE_PATH), attr_for_sf)
    #logger.debug "http.post.body: #{ x.body}"
  rescue => error
    Rails.logger.error('[ERROR] - Could not save Salesforce Lead')
    Rails.logger.error(error.to_s)
    Rails.logger.error(error.backtrace.join("\n"))
    raise error
  end
  
  protected
    def attr_for_sf
      attribs = {
        "first_name" => @snood.first_name,
        "last_name" => @snood.last_name,
        "email" => @snood.email,
        "company" => @snood.company ||= "not supplied",
        "lead_source" => "snood",
        "00N1a0000061qS8" => @snood.download,
        "emailOptOut" => !@snood.contactable,
        "phone" => @snood.phone,
        "oid" =>  ENV["salesforce_oid"]
        #"retURL" => "http://www.xxxxx.com/thank_you"
      }
    end
  
end