class Version < ApplicationRecord
  belongs_to :item, polymorphic: true
end