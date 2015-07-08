module Refinery
  module Snoods
    module Admin
      class SnoodsController < ::Refinery::AdminController
        
        respond_to :html
        crudify :'refinery/snoods/snood', :title_attribute => 'last_name'
        
        #http_basic_authenticate_with name: ENV["user_dev"], password: ENV["pw_dev"], except: [:show]
        #logger.debug "USER_DEV: #{ENV["user_dev"]}"
        def show
            @snood = Snood.find(params[:id])
          end

          def update
              @snood = Snood.find(params[:id])
              if @snood.update(snood_params)
                redirect_to "/refinery/snoods"
                #snoods/admin/snoods_path
              else
                render 'edit'
              end
            end      
                
        def index
            @snoods = Snood.paginate(:page => params[:page], :per_page => 30)
            # you can use meta fields from your model instead (e.g. browser_title)
            # by swapping @page for @snood in the line below:
            present(@page)
        end
                
        def destroy
            @snood = Snood.find(params[:id])  
            @snood.destroy  
            flash[:notice] = "Snood successfully destroyed."  
            redirect_to :back
        end

        private

        # Only allow a trusted parameter "white list" through.
        def snood_params
          params.require(:snood).permit(:first_name, :last_name, :email, :phone, :company, :download, :contactable)
        end
      end
    end
  end
end
