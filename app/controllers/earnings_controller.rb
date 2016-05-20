class EarningsController < ApplicationController
  def index
  end

  def retrieve
    params.delete_if { |k, v| v.blank? }
    if params[:earnings_beat] && params[:expectation_beat]
      @earnings = Earning.earning_expectation_beat(params[:earnings_beat], params[:expectation_beat])
    elsif beat = params[:earnings_beat]
      @earnings = Earning.earnings_beat beat
    elsif beat = params[:expectation_beat]
      @earnings = Earning.expectation_beat beat
    else
      @earnings = Earning.all
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def earnings_params
      params.require(:earnings).permit(:earnings, :expectation, :revenue)
    end
end
