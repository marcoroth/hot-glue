class CreateBorkeds < ActiveRecord::Migration[6.1]
  def change
    create_table :borkeds do |t|
      t.integer :xyz_id

      t.timestamps
    end
  end
end
