class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == 'tanimoto' && password == 'tanimoto1'
      end
    end

end

