# This migration comes from refinery_snoods (originally 1)
class CreateSnoodsSnoods < ActiveRecord::Migration

  def up
    create_table :refinery_snoods do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :company
      t.string :download
      t.boolean :contactable
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-snoods"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/snoods/snoods"})
    end

    drop_table :refinery_snoods

  end

end
