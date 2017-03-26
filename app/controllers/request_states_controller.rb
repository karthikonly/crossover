class RequestStatesController < ApplicationController
  # GET /request_states
  # GET /request_states.json
  def index
    @request_states = RequestState.all
  end
end
