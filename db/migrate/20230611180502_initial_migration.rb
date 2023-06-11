class InitialMigration < ActiveRecord::Migration[6.1]
  def change
    create_table 'answers', force: :cascade do |t|
      t.string 'name'
      t.integer 'question_id'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index ['question_id'], name: 'index_answers_on_question_id'
    end
  
    create_table 'elections', force: :cascade do |t|
      t.string 'name'
      t.datetime 'start_at'
      t.datetime 'end_at'
      if t.respond_to?(:jsonb); t.jsonb 'settings'; else; t.json 'settings' end
      t.integer 'user_id'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index ['user_id'], name: 'index_elections_on_user_id'
    end
  
    create_table 'questions', force: :cascade do |t|
      t.string 'name'
      t.integer 'election_id'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index ['election_id'], name: 'index_questions_on_election_id'
    end
  
    create_table 'users', force: :cascade do |t|
      t.string 'email', default: '', null: false
      t.string 'encrypted_password', default: '', null: false
      t.string 'reset_password_token'
      t.datetime 'reset_password_sent_at'
      t.datetime 'remember_created_at'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index ['email'], name: 'index_users_on_email', unique: true
      t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    end
  
    create_table 'voters', force: :cascade do |t|
      t.string 'name'
      t.string 'email'
      t.integer 'election_id'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index ['election_id'], name: 'index_voters_on_election_id'
    end
  end
end
