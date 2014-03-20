class SearchesController < ApplicationController
  Result = Struct.new(:title, :author)

  def index 
  end

  def create
    @page = params[:page].to_i || 0
    @results = []
    (10 + @page * 10).times do |n|
      @results << Result.new("Mega article ##{n}")
    end
  end
end
