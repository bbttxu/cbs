class AddNotesAndReasonForVisitToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :reason_for_visit, :string
    add_column :sessions, :notes, :string
  end
end
