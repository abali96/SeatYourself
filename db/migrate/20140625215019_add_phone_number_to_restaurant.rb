class AddPhoneNumberToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :phone_number, :integer
  end
end
