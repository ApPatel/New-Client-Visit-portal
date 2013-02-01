class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
   	  t.string :ground_trans_check
      t.text :ground_trans_text
      t.string :laptop_pass_check
      t.text :laptop_pass_text
      t.string :sez_pass_check
      t.text :sez_pass_text
      t.string :tcs_visitor_pass_check
      t.text :tcs_visitor_pass_text
      t.string :odc_access_check
      t.text :odc_access_text	
      t.text :email

      t.timestamps
    end
  end
end
