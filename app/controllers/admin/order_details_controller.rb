class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!, except: [:top]
  def update
  end
end
