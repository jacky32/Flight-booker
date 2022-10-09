module ApplicationHelper
  def resource_name
    :passenger
  end

  def resource
    @resource ||= Passenger.new
  end

  def resource_class
    Passenger
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:passenger]
  end
end
