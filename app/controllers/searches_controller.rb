class SearchesController < ApplicationController
  before_filter :init_query, only: [:index]

  def index 
    @query = params[:query]
  end

  def create
    @page = params[:page].to_i || 0
    @parsed_query = XQL::Parser.new.parse(params[:query])
      
    conditions = {}
    conditions[:_type] = @parsed_query[:type].to_s.classify
    if @parsed_query[:condition]
      conditions[@parsed_query[:condition][:key].to_sym] = @parsed_query[:condition][:value].values[0].to_s
    end

    @nodes = Node.where(conditions)
  end

  protected

  def init_query
    params[:query] = "select articles" if params[:query].blank?
  end
end
