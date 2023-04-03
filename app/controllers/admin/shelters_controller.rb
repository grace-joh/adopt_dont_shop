class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.order_by_name_desc
    @shelters_app_pending = Shelter.with_pending_app
  end
end
