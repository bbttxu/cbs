class AddPhoneNumberToVolunteers < ActiveRecord::Migration
  def change
  	add_column :volunteers, :phone_number, :string
  end
end
