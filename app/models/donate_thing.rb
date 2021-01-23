class DonateThing < ApplicationRecord
  enum category: [:Makanan, :Pakaian, :"Alat Tulis", :Buku, :"Lain-Lain"]
end
