# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_180_905_050_625) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'projects', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
  end

  create_table 'tasks', force: :cascade do |t|
    t.string 'content'
    t.bigint 'project_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'completed_at'
    t.date 'deadline'
    t.index ['project_id'], name: 'index_tasks_on_project_id'
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

  add_foreign_key 'tasks', 'projects'
end
