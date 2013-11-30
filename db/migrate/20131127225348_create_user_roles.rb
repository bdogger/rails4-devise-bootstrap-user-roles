class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.references :user, index: true
      t.references :role, index: true

      t.timestamps
    end
    add_index :user_roles, [:role_id, :user_id], unique: true
  end
end
