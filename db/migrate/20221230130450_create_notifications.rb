class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :comment_id
      t.integer :visitor_id,null: false
      t.integer :visited_id,null: false
      t.integer :post_id
      t.string :action,null: false,default: ""
      t.boolean :checked,default: false

      t.timestamps
    end
  end
end
