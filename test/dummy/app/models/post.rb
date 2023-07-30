class Post < ApplicationRecord
  has_simple_history # History tracking

  has_rich_text :body
end
