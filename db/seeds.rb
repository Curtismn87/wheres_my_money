# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

wal_mart = Store.create(name: "Wal-Mart", total_spent: 0)
target = Store.create(name: "target", total_spent: 0)

wal_mart.items.create(name: "Shampoo", amount: 5)
wal_mart.items.create(name: "Soap", amount: 2)
wal_mart.items.create(name: "Candy", amount: 3)
wal_mart.items.create(name: "Sauce Pan", amount: 7)

target.items.create(name: "Chair", amount: 15)
target.items.create(name: "Pillow", amount: 6)
target.items.create(name: "Mouse", amount: 20)
