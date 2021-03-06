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

ActiveRecord::Schema.define(version: 20180427002954) do

  create_table "collections", force: :cascade do |t|
    t.integer "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mix_id"
    t.index ["mix_id"], name: "index_collections_on_mix_id"
    t.index ["song_id"], name: "index_collections_on_song_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.string "state"
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "mixes", force: :cascade do |t|
    t.string "mix_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_mixes_on_user_id"
  end

  create_table "song_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "song_id"
    t.index ["song_id"], name: "index_song_users_on_song_id"
    t.index ["user_id"], name: "index_song_users_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "song_title"
    t.string "song_artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mp3_file_name"
    t.string "mp3_content_type"
    t.integer "mp3_file_size"
    t.datetime "mp3_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
