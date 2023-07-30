module SimpleHistory
  class History < ApplicationRecord
    belongs_to :record, polymorphic: true
    belongs_to :user, polymorphic: true, optional: true

    serialize :changed_data, JSON
  end
end
