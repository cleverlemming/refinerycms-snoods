# encoding: utf-8
# spec/features/refinery/snoods/admin/snoods_spec.rb

require "spec_helper"
describe Refinery do
  describe "Snoods" do
    describe "Admin" do
      describe "snoods", type: :feature do

        refinery_login_with :refinery_user
        describe "snoods list" do
          before do 
            FactoryGirl.build(:snood, :last_name => "Poe", :email => "tef@tefpoe.com").save(validate: false)    
            #FactoryGirl.create(:snood, :last_name => "Poe", :email => "tef@tefpoe.com")
          end
          it "should contain last name and email" do
            visit refinery.snoods_admin_snoods_path
            expect(page).to have_content("Poe")
            expect(page).to have_content("tef@tefpoe.com")
          end
        end

        describe "create" do
          before do
            visit refinery.snoods_admin_snoods_path

            click_link "Add New Snood"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Email", :with => "tef2@tefpoe.com"
              fill_in "Last Name", :with => "Poe"
              expect { click_button "Save" }.to change(Refinery::Snoods::Snood, :count).by(1)


              expect(page).to have_content("'Poe' was successfully added.")
            end
          end
          #fail
          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Snoods::Snood, :count)

              expect(page).to have_content("Email can't be blank")
            end
          end

          context "duplicate" do
            #before { FactoryGirl.create(:snood, :first_name => "Poe", :email => "tef2@tefpoe.com") }

            it "should fail" do
              visit refinery.snoods_admin_snoods_path

              click_link "Add New Snood"

              fill_in "Last Name", :with => "Poe"
               fill_in "Email", :with => "tef@tefpoe.com"
              expect { click_button "Save" }.not_to change(Refinery::Snoods::Snood, :count)

              expect(page).to have_content("Email has already been taken")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:snood, :last_name => "A last_name", :email => "tef3@tefpoe.com") }

          it "should succeed" do
            visit refinery.snoods_admin_snoods_path

            within "#sortable_list" do 
              find('li', :text => "A last_name").find_link("Edit this snood").click
            end

            fill_in "Last Name", :with => "A different last_name"
            click_button "Save"

            expect(page).to have_content("'A different last_name' was successfully updated.")
            expect(page).not_to have_content("A last_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:snood, :last_name => "Unique", :email => "tef4@tefpoe.com") }

          it "should succeed" do
            visit refinery.snoods_admin_snoods_path
            expect{ 
              within "#sortable_list" do 
                  find('li', :text => "Unique").find_link("Remove this snood forever").click
                end
              }.to change(Refinery::Snoods::Snood, :count).by(-1)
                
            expect(page).to have_content("'Unique' was successfully removed.")
           #expect(Refinery::Snoods::Snood.count).to change(Refinery::Snoods::Snood, :count).by(-1)
            
          end
        end

      end
    end
  end
end
