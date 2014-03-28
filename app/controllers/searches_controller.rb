class SearchesController < ApplicationController
  def index
    result = Search.perform(params: params)

    if result.success?
      @nodes  = result.nodes
    else
      @message = result.message
    end
  end
end
