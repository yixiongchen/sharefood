class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :mailbox, :conversation
  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end
  
  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  protected

end
