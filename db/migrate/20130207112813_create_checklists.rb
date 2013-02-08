class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.string :GroundTransCheck
      t.string :GroundTransComment
      t.string :LaptopPassCheck
      t.string :LaptopPassComment
      t.string :SEZPassCheck
      t.string :SEZPassComment
      t.string :TCSVisitorPassCheck
      t.string :TCSVisitorPassComment
      t.string :ODCAccessCheck
      t.string :ODCAccessComment
      t.integer :visit_id
      t.string :email

      t.timestamps
      
    end
  end
end
