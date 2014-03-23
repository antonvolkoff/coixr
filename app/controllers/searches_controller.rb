class SearchesController < ApplicationController
  before_filter :init_query, only: [:index]

  def index 
    @query = params[:query]
  end

  def create
    result = Search.perform(params: params)

    if result.success?
      @nodes  = result.nodes
      @page   = params[:page].to_i || 0
    else
      @message = result.message
    end
  end

  protected

  def init_query
    params[:query] = "articles" if params[:query].blank?
  end
end
