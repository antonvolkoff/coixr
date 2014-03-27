class SearchesController < ApplicationController
  def index
  end

  def create
    result = Search.perform(params: params)

    if result.success?
      @nodes  = NodeDecorator.decorate_collection(result.nodes)
      @page   = params[:page].to_i || 0
    else
      @message = result.message
    end
  end
end
