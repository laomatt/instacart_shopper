class AddStatusToApplicants < ActiveRecord::Migration[5.0]
  def change
  	add_column :applicants, :status_id, :integer,  :default => 0
  end
end
