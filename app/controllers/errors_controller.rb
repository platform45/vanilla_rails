class ErrorsController < ApplicationController

  def error_404
    render :error_404, status: 404
  end

  def error_422
    render :error_422, status: 422
  end

  def error_500
    render :error_500, status: 500
  end

  def error_outdated_browser
    render :error_outdated_browser, layout: false
  end

end
