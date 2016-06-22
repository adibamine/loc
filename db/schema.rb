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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160621232505) do

  create_table "clients", force: :cascade do |t|
    t.string  "nom",       limit: 255
    t.string  "prenom",    limit: 255
    t.string  "cin",       limit: 255
    t.integer "age",       limit: 4
    t.string  "ville",     limit: 255
    t.string  "telephone", limit: 255
    t.string  "email",     limit: 255
  end

  create_table "commandes", force: :cascade do |t|
    t.string   "nom_societe",     limit: 255
    t.string   "email_societe",   limit: 255
    t.string   "tel_societe",     limit: 255
    t.string   "adresse_societe", limit: 255
    t.text     "note",            limit: 65535
    t.string   "plan",            limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "emails", force: :cascade do |t|
    t.integer  "voiture_id",     limit: 4,   default: 0
    t.string   "nom",            limit: 255
    t.string   "sender_email",   limit: 255
    t.string   "contenu",        limit: 255
    t.string   "objet",          limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "receiver_email", limit: 255
    t.integer  "user_id",        limit: 4,   default: 0
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "voiture_id",         limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "photos", ["voiture_id"], name: "index_photos_on_voiture_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "client_id",  limit: 4
    t.integer  "voiture_id", limit: 4
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "prix",       limit: 4
    t.integer  "total",      limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "active",               default: true
  end

  add_index "reservations", ["client_id"], name: "index_reservations_on_client_id", using: :btree
  add_index "reservations", ["voiture_id"], name: "index_reservations_on_voiture_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "name",       limit: 255,               null: false
    t.string   "email",      limit: 255
    t.text     "comment",    limit: 65535,             null: false
    t.integer  "star",       limit: 4,     default: 1
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "image",                  limit: 255
    t.string   "phone_number",           limit: 255
    t.text     "description",            limit: 65535
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "compteur",               limit: 4,     default: 0
    t.float    "latitude",               limit: 24
    t.float    "longitude",              limit: 24
    t.string   "address",                limit: 255
    t.string   "name",                   limit: 255,                null: false
    t.integer  "cars_limit",             limit: 4,     default: 2
    t.integer  "compteur_msg",           limit: 4,     default: 0
    t.integer  "compteur_num",           limit: 4,     default: 0
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.string   "url",                    limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "voitures", force: :cascade do |t|
    t.string   "annee",                 limit: 255
    t.string   "marque",                limit: 255
    t.string   "modele",                limit: 255
    t.string   "kilometrage",           limit: 255
    t.string   "boite_vitesse",         limit: 255
    t.string   "energie",               limit: 255
    t.integer  "consommation",          limit: 4
    t.text     "description",           limit: 65535
    t.string   "ville",                 limit: 255
    t.integer  "prix",                  limit: 4
    t.integer  "user_id",               limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "active"
    t.boolean  "is_clim"
    t.boolean  "is_direction_assiste"
    t.boolean  "is_regulateur_vitesse"
    t.boolean  "is_gps"
    t.boolean  "is_lecteur_cd"
    t.boolean  "is_audio_input"
    t.integer  "nb_places",             limit: 4
    t.integer  "nb_portes",             limit: 4
    t.boolean  "is_return_marrakech"
    t.boolean  "is_return_agadir"
    t.boolean  "is_return_casablanca"
    t.boolean  "is_return_kenitra"
    t.boolean  "is_return_laayoun"
    t.boolean  "is_return_fes"
    t.boolean  "is_return_rabat"
    t.boolean  "is_return_essaouira"
    t.integer  "compteur_num",          limit: 4,     default: 0
    t.integer  "compteur_msg",          limit: 4,     default: 0
    t.integer  "compteur",              limit: 4,     default: 0
  end

  add_index "voitures", ["user_id"], name: "index_voitures_on_user_id", using: :btree

  add_foreign_key "photos", "voitures"
  add_foreign_key "reservations", "clients"
  add_foreign_key "reservations", "voitures"
  add_foreign_key "reviews", "users"
  add_foreign_key "voitures", "users"
end
