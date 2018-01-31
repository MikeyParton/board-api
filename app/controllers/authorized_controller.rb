class AuthorizedController < ApplicationController
  before_action :authorize_request
end
