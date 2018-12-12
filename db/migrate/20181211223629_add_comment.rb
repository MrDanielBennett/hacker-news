class AddComment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.column :user_id, :integer
      t.column :post_id, :integer
      t.column :content, :string
    end
  end
end
