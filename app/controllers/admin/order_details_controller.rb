class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def updated
  end
end
