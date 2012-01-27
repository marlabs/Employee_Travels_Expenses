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

ActiveRecord::Schema.define(:version => 20120118071410) do

  create_table "billexpensedetails", :force => true do |t|
    t.integer  "billexpense_id"
    t.integer  "billNo"
    t.date     "billDate"
    t.integer  "expenseTypeId"
    t.float    "amount"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "billexpensedetails", ["billexpense_id"], :name => "index_billexpensedetails_on_billexpense_id"

  create_table "billexpenses", :force => true do |t|
    t.integer  "billexpid"
    t.string   "claimPrefix"
    t.integer  "empid"
    t.integer  "approverid"
    t.string   "attachLocation"
    t.boolean  "clientBillable"
    t.string   "remarks"
    t.integer  "approved"
    t.date     "travelFromDate"
    t.date     "travelToDate"
    t.float    "grandTotal"
    t.string   "filename"
    t.string   "content_type"
    t.binary   "data"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "books", :force => true do |t|
    t.string   "title",       :limit => 32, :null => false
    t.float    "price"
    t.integer  "subject_id"
    t.text     "description"
    t.datetime "created_at"
  end

  create_table "departments", :force => true do |t|
    t.integer "deptid"
    t.string  "name"
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.integer  "empid"
    t.integer  "deptid"
    t.integer  "projectid"
    t.integer  "raid"
    t.string   "email"
    t.datetime "created_at"
  end

  create_table "expensedetails", :force => true do |t|
    t.integer "expense_id"
    t.string  "description"
    t.date    "expDate"
    t.float   "travelExp"
    t.float   "localConvey"
    t.float   "perDiem"
    t.float   "lodgingExp"
    t.float   "mealsExp"
    t.float   "clientEntmnt"
    t.float   "telephoneExp"
    t.float   "miscExp"
    t.float   "totalExp"
    t.float   "compPaid"
    t.float   "totalClaim"
  end

  add_index "expensedetails", ["expense_id"], :name => "index_expensedetails_on_expense_id"

  create_table "expenses", :force => true do |t|
    t.integer "expid"
    t.string  "claimPrefix"
    t.integer "empid"
    t.integer "approverid"
    t.date    "travelFromDate"
    t.date    "travelToDate"
    t.string  "attachLocation"
    t.boolean "clientBillable"
    t.float   "netDue"
    t.float   "advance"
    t.date    "submissionDate"
    t.string  "remarks"
    t.integer "approved"
    t.float   "sumTravelExp"
    t.float   "sumLocalConvey"
    t.float   "sumPerDiem"
    t.float   "sumLodgingExp"
    t.float   "sumMealsExp"
    t.float   "sumClientEntmnt"
    t.float   "sumTelephoneExp"
    t.float   "sumMiscExp"
    t.float   "sumTotalExp"
    t.float   "sumCompPaid"
    t.float   "sumTotalClaim"
    t.float   "grandTotal"
    t.string  "filename"
    t.string  "content_type"
    t.binary  "data"
  end

  create_table "expensetypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.integer "projid"
    t.string  "name"
  end

  create_table "subjects", :force => true do |t|
    t.string "name"
  end

end
