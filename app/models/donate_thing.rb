class DonateThing < ApplicationRecord
  enum category: [:Makanan, :Pakaian, :"Alat Tulis", :Buku, :"Lain-Lain"]
  has_one_attached :image
end
