module Apartment
  module ActiveJob
    module Core
      attr_accessor :tenant

      module ClassMethods
        def deserialize(job_data)
          super
          job.tenant = job_data['tenant']
        end
      end

      def serialize
        super.merge({'tenant' => Apartment::Tenant.current})
      end
    end
  end
end
