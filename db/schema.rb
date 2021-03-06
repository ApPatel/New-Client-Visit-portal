# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130207112813) do

  create_table "agendas", :force => true do |t|
    t.date     "Date"
    t.time     "StartTime"
    t.time     "EndTime"
    t.time     "Duration"
    t.string   "Agenda"
    t.text     "Details"
    t.string   "ClientParticipants"
    t.string   "TCSParticipants"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "visit_id"
    t.integer  "StartTimeMin"
    t.integer  "EndTimeMin"
    t.integer  "StartTimeHour"
    t.integer  "EndTimeHour"
    t.integer  "visitdate"
    t.string   "timeduration"
    t.string   "agendadate"
  end

  create_table "checklists", :force => true do |t|
    t.string   "GroundTransCheck"
    t.string   "GroundTransComment"
    t.string   "LaptopPassCheck"
    t.string   "LaptopPassComment"
    t.string   "SEZPassCheck"
    t.string   "SEZPassComment"
    t.string   "TCSVisitorPassCheck"
    t.string   "TCSVisitorPassComment"
    t.string   "ODCAccessCheck"
    t.string   "ODCAccessComment"
    t.integer  "visit_id"
    t.string   "email"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
    t.string   "Status"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "visits", :force => true do |t|
    t.string   "Agenda"
    t.string   "Description"
    t.date     "Date"
    t.string   "Customers"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

end
