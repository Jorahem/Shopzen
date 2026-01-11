# This schema is taken from the provided specification and represents the initial schema.

#{`echo "#{File.read('/dev/null') rescue ''}"`}

create_table "users", force: :cascade do |t|
  t.string "email", null: false
  t.string "encrypted_password", null: false
  t.string "first_name"
  t.string "last_name"
  t.string "phone"
  t.datetime "email_confirmed_at"
  t.integer "role", default: 0
  t.timestamps

  t.index ["email"], unique: true
  t.index ["phone"], unique: true
end

create_table "addresses", force: :cascade do |t|
  t.references "user", null: false, foreign_key: true
  t.string "address_type"
  t.string "full_name"
  t.string "phone"
  t.string "address_line1"
  t.string "address_line2"
  t.string "city"
  t.string "state"
  t.string "postal_code"
  t.string "country"
  t.boolean "is_default", default: false
  t.timestamps

  t.index ["user_id", "is_default"]
end

create_table "categories", force: :cascade do |t|
  t.string "name", null: false
  t.string "slug", null: false
  t.text "description"
  t.integer "parent_id"
  t.integer "position", default: 0
  t.boolean "active", default: true
  t.string "icon_url"
  t.timestamps

  t.index ["slug"], unique: true
  t.index ["parent_id"]
end

create_table "products", force: :cascade do |t|
  t.references "category", null: false, foreign_key: true
  t.references "seller", foreign_key: { to_table: :users }
  t.string "name", null: false
  t.string "slug", null: false
  t.text "description"
  t.text "short_description"
  t.decimal "price", precision: 10, scale: 2, null: false
  t.decimal "compare_at_price", precision: 10, scale: 2
  t.decimal "cost_per_item", precision: 10, scale: 2
  t.string "sku"
  t.string "barcode"
  t.integer "stock_quantity", default: 0
  t.integer "low_stock_threshold", default: 5
  t.decimal "weight", precision: 8, scale: 2
  t.string "weight_unit", default: "kg"
  t.boolean "requires_shipping", default: true
  t.boolean "active", default: true
  t.boolean "featured", default: false
  t.integer "views_count", default: 0
  t.decimal "average_rating", precision: 3, scale: 2, default: 0
  t.integer "reviews_count", default: 0
  t.timestamps

  t.index ["slug"], unique: true
  t.index ["sku"], unique: true
  t.index ["category_id"]
  t.index ["seller_id"]
  t.index ["active", "featured"]
  t.index ["created_at"]
end

# NOTE: For brevity in this initial commit, additional tables from the specification (images, variants, carts, orders, payments, etc.) will be created via migrations in follow-up commits. The full schema will be added iteratively.
