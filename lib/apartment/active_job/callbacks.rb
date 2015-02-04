module Apartment
  module ActiveJob
    module Callbacks
      included do
        before_perform do |job|
          Apartment::Tenant.switch tenant
        end
      end
    end
  end
end
