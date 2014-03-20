class SearchesController < ApplicationController
  Result = Struct.new(:title, :author)

  def index 
  end

  def create
    @results = []
    10.times do |n|
      @results << Result.new("Mega article ##{n}")
    end
  end
end
