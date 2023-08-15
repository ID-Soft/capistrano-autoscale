# frozen_string_literal: true

module Capistrano
  module Autoscale
    module AWS
      class Instance < Base
        STATE_RUNNING = 16

        attr_reader :aws_counterpart, :id, :public_ip, :state

        def initialize(id, public_ip, state)
          @id = id
          @public_ip = public_ip
          @state = state
          @aws_counterpart = ::Aws::EC2::Instance.new id, client: ec2_client
        end

        def running?
          state == STATE_RUNNING
        end
      end
    end
  end
end
