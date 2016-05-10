module API
  module V1
    class EarningsController < ApplicationController
      def index
        earnings = Earning.all
        render json: earnings, each_serializer: EarningSerializer, root: false, status: 200
      end
    end
  end
end
