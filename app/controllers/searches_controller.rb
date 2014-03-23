class SearchesController < ApplicationController
  before_filter :init_query, only: [:index]

  def index 
    @query = params[:query]
  end

  def create
    @page = params[:page].to_i || 0
    @parsed_query = XQL::Parser.new.parse(params[:query])
    @nodes = Node.where(_type: @parsed_query[:type].to_s.classify)
  end

  protected

  def init_query
    params[:query] = "select articles" if params[:query].blank?
  end
end
