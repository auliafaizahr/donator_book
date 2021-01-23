class Donate < ApplicationRecord
  enum category: [:Sedekah, :Infaq, :Lain]
end
