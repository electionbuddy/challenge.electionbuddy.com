class CreateElectionLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :election_logs do |t|
      t.references :election
      t.string :activity
      
      t.timestamps
    end
  end
end