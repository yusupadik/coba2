# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  users = User.create([ {:first_name => "Yusup", :last_name => "kristiyanto", :email => "yak.3003@gmail.com", :username => "adi", :address => "Tugu Muda, Semarang", :age => "22", :birthday => 30-03-90 },

                        {:first_name => "Joni", :last_name => "Andre", :email => "ja@gmail.com", :username => "jonad", :address => "Antah berantah", :age => "22", :birthday => 30-12-90 },

                        {:first_name => "David", :last_name => "Beckham", :email => "becks@gmail.com", :username => "db07", :address => "London Selatan no. 26", :age => "32", :birthday => 30-03-80 },

                        {:first_name => "Mario", :last_name => "Teguh", :email => "super@gmail.com", :username => "mtgw", :address => "Jalan Emas, Metro", :age => "42", :birthday => 30-03-70 },

                        {:first_name => "Andrea", :last_name => "Hirata", :email => "laspel.3003@gmail.com", :username => "ikal", :address => "Bintong", :age => "52", :birthday => 30-03-60 }
                      ])

  countries= Country.create([{:code => "001", :name => "Indonesia" },
                             {:code => "002", :name => "Vatikan" },
                             {:code => "003", :name => "USA" },
                             {:code => "004", :name => "GBR" },
                             {:code => "005", :name => "Japan" }  
                            ])

  comments= Comment.create([ {:content => "bagus sekali"},
                             {:content => "Very nice"},
                             {:content => "Very good"},
                             {:content => "super sekal"},
                             {:content => "not bad at all"},
                          ])

  articles= Article.create([ {:title => "good", :body => "it's very good, i love it"},
                             {:title => "super", :body => "Luar biasa, super sekali"},
                             {:title => "masih kurang", :body => "masih ada sedikit kekurangan"},
                             {:title => "great", :body => "I think it's awesome"},
                             {:title => "mantap", :body => "Mantap gannnnnnnnnnnnn"},  
                          ])
