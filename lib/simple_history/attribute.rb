

module SimpleHistory
  module Attribute
    extend ActiveSupport::Concern

    # thread_mattr_accessor :current_user

    included do
      after_create   :record_simple_history
      after_update_commit   :record_simple_history
      after_destroy :record_simple_history
    end

    private

    def record_simple_history
      # SimpleHistory::RecordHistoryJob.perform_later(
      #   self, self.changes.to_json, SimpleHistory::HasSimpleHistory.current_user, history_action
      # )
      # SimpleHistory::Attribute.current_user = nil

      if history_action.eql?('destroyed')
        History.create(
          record: self,
          changed_data: self.attributes.to_json,
          user: nil,
          action: history_action
        )
      else

        return if self.previous_changes.empty?
        History.create(
          record: self,
          changed_data: self.previous_changes.to_json,
          user: nil,
          action: history_action
        )
      end
    end

    def history_action
      return 'destroyed' if destroyed?
      return 'created' if created_at.eql?(updated_at)
      return 'updated' if updated_at > created_at
    end
  end
end

# Load the has_simple_history methods
ActiveSupport.on_load(:active_record) do
  class ActiveRecord::Base
    def self.has_simple_history(options = {})
      include SimpleHistory::Attribute
    end
  end
end
