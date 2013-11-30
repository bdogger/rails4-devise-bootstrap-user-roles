class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.string :description, null: false

      t.timestamps
    end
    add_index :roles, :name, unique: true
    Role.create(name: 'employee', description: 'Employee')
    Role.create(name: 'admin', description: 'Admin')
  end
end
