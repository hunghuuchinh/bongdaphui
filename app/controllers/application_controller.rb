class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :search_form
  protect_from_forgery with: :exception
  include SessionsHelper
  private
  def search_form
    @search = Pitch.all.search params[:q]
  end


end
