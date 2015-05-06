module Apartment
  module ActiveJob
    extend ActiveSupport::Concern

    class_methods do
      def deserialize(job_data)
        Apartment::Tenant.switch job_data['tenant']
        super
      end
    end

    def serialize
      super.merge({'tenant' => Apartment::Tenant.current})
    end
  end
end
