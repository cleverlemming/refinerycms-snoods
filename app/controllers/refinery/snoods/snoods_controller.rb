# vendor/extensions/snoods/app/controllers/refinery/snoods/snoods_controller.rb

module Refinery
  module Snoods
    class SnoodsController < ::ApplicationController
      include SalesforceSubmit
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @snood in the line below:
        present(@page)
      end
      
      # GET /prospects/new
      def new
        @snood = Snood.new
        @snood.contactable = true
      end
      
        def create
          @snood = Snood.new(snood_params)
          #logger.debug "Snood attributes hash: #{@snood.attributes.inspect}"
          if @snood.save
            #logger.debug "Snood saved: #{@snood.attributes.inspect}"
            web_to_lead()
            render "bravo"
            CourtesyMailer.thanx_email(@snood).deliver!
            logger.debug "post-mailer"
          else
            flash.now[:notice] = "Error"
            render :new
          end
        end

      def show
        @snood = Snood.find(params[:id])
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @snood in the line below:
        present(@page)
      end
      
      def bravo
        logger.warn "New prospect saved!"
      end

    protected

      def find_all_snoods
        @snoods = Snood.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/snoods").first
      end
      
      private 
      
      # Only allow a trusted parameter "white list" through.
      def snood_params
        params.require(:snood).permit(:email, :first_name, :last_name, :company, :phone, :download, :contactable)
      end

    end
  end
end
