module Apartment
  module ActiveJob
    extend ActiveSupport::Concern

    class_methods do
      def execute(job_data)
        Apartment::Tenant.switch(job_data['tenant']) do
          super
        end
      end
    end

    def initialize(*arguments)
      @tenant = Apartment::Tenant.current
      super(*arguments)
    end

    def enqueue(*arguments)
      Apartment::Tenant.switch('public') do
        super(*arguments)
      end
    end

    def serialize
      super.merge('tenant' => @tenant)
    end
  end
end
