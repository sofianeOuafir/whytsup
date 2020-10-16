class News < ApplicationRecord
  belongs_to :headline
  belongs_to :author
end
