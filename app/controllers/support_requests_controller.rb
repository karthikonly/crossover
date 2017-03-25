class SupportRequestsController < ApplicationController
  before_action :set_support_request, only: [:show, :edit, :update, :destroy]
  before_action :validate_current_user

  # GET /support_requests
  # GET /support_requests.json
  def index
    @support_requests = SupportRequest.all.order(updated_at: :desc)
  end

  # GET /support_requests/1
  # GET /support_requests/1.json
  def show
  end

  # GET /support_requests/1/edit
  def edit
  end

  # PATCH/PUT /support_requests/1
  # PATCH/PUT /support_requests/1.json
  def update
    @support_request.handler = current_user
    @support_request.current_user = current_user
    respond_to do |format|
      if @support_request.update(support_request_params)
        format.html { redirect_to @support_request, notice: 'Support request was successfully updated.' }
        format.json { render :show, status: :ok, location: @support_request }
      else
        format.html { render :edit }
        format.json { render json: @support_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /support_requests/1
  # DELETE /support_requests/1.json
  def destroy
    @support_request.destroy
    respond_to do |format|
      format.html { redirect_to support_requests_url, notice: 'Support request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # check if the current user is admin
    def validate_current_user
      redirect_to :root, alert: "you must be admin to visit this part" unless current_user.admin?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_support_request
      @support_request = SupportRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def support_request_params
      params.require(:support_request).permit(:title, :product_id, :request_state_id, :description)
    end
end
