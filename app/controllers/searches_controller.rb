class SearchesController < ApplicationController
  before_filter :init_query, only: [:index]

  def index 
    @query = params[:query]
  end

  def create
    @page = params[:page].to_i || 0

    parse_result = ParseQuery.perform(params: params)
    if parse_result.success?
      result = SearchWithConditions.perform(conditions: parse_result.conditions)
      @nodes = result.nodes
      unless result.success?
        @message = result.message
      end
    else
      @message = result.message
    end
  end

  protected

  def init_query
    params[:query] = "articles" if params[:query].blank?
  end
end
