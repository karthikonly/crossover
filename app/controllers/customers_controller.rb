class CustomersController < ApplicationController
  before_action :set_support_request, only: [:show, :edit, :update, :destroy]
  before_action :validate_current_user

  # GET /customers
  # GET /customers.json
  def index
    @support_requests = SupportRequest.where(creator_id: current_user.id)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @support_request = SupportRequest.new
    @products = Product.all
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @support_request = SupportRequest.new(support_request_create_params)
    @support_request.creator = current_user
    @support_request.request_state = RequestState.find(1)
    @support_request.current_user = current_user
    respond_to do |format|
      if @support_request.save
        format.html { redirect_to customer_path(@support_request), notice: 'Support request was successfully created.' }
        format.json { render :show, status: :created, location: customer_path(@support_request) }
      else
        format.html { render :new }
        format.json { render json: @support_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    @support_request.current_user = current_user
    respond_to do |format|
      if @support_request.update(support_request_edit_params)
        format.html { redirect_to customer_path(@support_request), notice: 'Support request was successfully updated.' }
        format.json { render :show, status: :ok, location: customer_path(@support_request) }
      else
        format.html { render :edit }
        format.json { render json: @support_request.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # check if the current user is customer
    def validate_current_user
      redirect_to :root, alert: "you must be customer to visit this part" unless current_user.customer?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_support_request
      @support_request = SupportRequest.find(params[:id])
      redirect_to :root, alert: "you do not have authority to view this object." unless @support_request.creator == current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def support_request_create_params
      params.require(:support_request).permit(:product_id, :title, :description)
    end

    def support_request_edit_params
      params.require(:support_request).permit(:description)
    end
end
