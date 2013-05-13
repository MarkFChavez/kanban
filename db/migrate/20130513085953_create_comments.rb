class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.references :task

      t.timestamps
    end
    add_index :comments, :task_id
  end
end
