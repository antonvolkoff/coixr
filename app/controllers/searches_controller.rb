class SearchesController < ApplicationController
  before_filter :init_query, only: [:index]

  def index 
    @query = params[:query]
  end

  def create
    @page = params[:page].to_i || 0
    conditions = XQL.parse(params[:query])

    result = SearchWithConditions.perform(conditions: conditions)
    @nodes = result.nodes
    unless result.success?
      @message = result.message
    end
  end

  protected

  def init_query
    params[:query] = "articles" if params[:query].blank?
  end
end
