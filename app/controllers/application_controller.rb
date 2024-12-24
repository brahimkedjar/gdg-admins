class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  protect_from_forgery with: :null_session, if: -> { request.format.json? }

end
