class SearchesController < ApplicationController
  Result = Struct.new(:title, :author)

  before_filter :init_query, only: [:index]

  def index 
    @query = params[:query]
  end

  def create
    @page = params[:page].to_i || 0
    @results = []
    (10 + @page * 10).times do |n|
      @results << Result.new("Mega article ##{n}")
    end
  end

  protected

  def init_query
    params[:query] = "select articles" if params[:query].blank?
  end
end
