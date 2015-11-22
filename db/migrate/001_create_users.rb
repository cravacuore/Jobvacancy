migration 1, :create_users do
  up do
    create_table :users do
      column :id, Integer, :serial => true
      column :name, DataMapper::Property::String, :length => 255
      column :crypted_password, DataMapper::Property::String, :length => 255
      column :email, DataMapper::Property::String, :length => 255
      column :attempts, DataMapper::Property::Integer
      column :blocked, DataMapper::Property::Boolean
      column :time_of_block, DataMapper::Property::Time
    end
  end

  down do
    drop_table :users
  end
end
