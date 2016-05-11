module API
  module V1
    class EarningsController < ApplicationController
      def index
        if beat = params[:earnings_beat]
           earnings = Earning.earnings_beat beat
        elsif beat = params[:expectation_beat]
          earnings = Earning.expectation_beat beat
        else
          earnings = Earning.all
        end
        render json: earnings, each_serializer: EarningSerializer, root: false, status: 200
      end
    end
  end
end
