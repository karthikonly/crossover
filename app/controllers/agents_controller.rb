class AgentsController < ApplicationController
  before_action :set_support_request, only: [:show, :edit, :update]
  before_action :validate_current_user

  # GET /agents
  # GET /agents.json
  def index
    # only un-deleted requests belonging to all users, order by latest on top
    @support_requests = SupportRequest.order(updated_at: :desc)
  end

  # GET /agents/1
  # GET /agents/1.json
  def show
  end

  # GET /agents/1/edit
  def edit
  end

  # PATCH/PUT /agents/1
  # PATCH/PUT /agents/1.json
  def update
    @support_request.handler = current_user
    @support_request.current_user = current_user
    respond_to do |format|
      if @support_request.update(support_request_edit_params)
        format.html { redirect_to agent_path(@support_request), notice: 'Support request was successfully updated.' }
        format.json { render :show, status: :ok, location: agent_path(@support_request) }
      else
        format.html { render :edit }
        format.json { render json: @support_request.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # check if the current user is agent
    def validate_current_user
      redirect_to :root, alert: "you must be support agent to visit this part" unless current_user.agent?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_support_request
      @support_request = SupportRequest.includes(:support_logs).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def support_request_edit_params
      params.require(:support_request).permit(:request_state_id, :description)
    end
end
