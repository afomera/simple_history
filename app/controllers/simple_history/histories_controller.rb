module SimpleHistory
  class HistoriesController < ApplicationController
    def index
      if params["record_type"].present? && params["record_id"].present?
        @histories = History.where(record_type: params["record_type"], record_id: params["record_id"]).order(created_at: :desc)
      elsif params["record_type"].present?
        @histories = History.where(record_type: params["record_type"]).order(created_at: :desc)
      else
        @histories = History.all.order(created_at: :desc)
      end
      @record_types = History.pluck(:record_type).uniq
    end

    def show
      @history = History.find(params[:id])
    end
  end
end
