class StoreditemsController < ApplicationController

  before_action :authorize_api_request, only: [:create]
  before_action :authenticate_user!

  before_action :set_storeditem, only: [:show, :edit, :update, :destroy, :download]

  # GET /storeditems
  # GET /storeditems.json
  def index
    @storeditems = current_user.storeditems.order("created_at DESC").page params[:page]
  end

  # GET /storeditems/1
  # GET /storeditems/1.json
  def show
  end

  # GET /storeditems/new
  def new
    @storeditem = current_user.storeditems.new
  end

  # GET /storeditems/1/edit
  def edit
  end

  # POST /storeditems
  # POST /storeditems.json
  def create
    @storeditem = current_user.storeditems.new(storeditem_params)

    respond_to do |format|
      if @storeditem.save
        format.html { redirect_to @storeditem, notice: 'Storeditem was successfully created.' }
        format.json { render :show, status: :created, location: @storeditem }
      else
        format.html { render :new }
        format.json { render json: @storeditem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storeditems/1
  # PATCH/PUT /storeditems/1.json
  def update
    respond_to do |format|
      if @storeditem.update(storeditem_params)
        format.html { redirect_to @storeditem, notice: 'Storeditem was successfully updated.' }
        format.json { render :show, status: :ok, location: @storeditem }
      else
        format.html { render :edit }
        format.json { render json: @storeditem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storeditems/1
  # DELETE /storeditems/1.json
  def destroy
    @storeditem.destroy
    respond_to do |format|
      format.html { redirect_to storeditems_url, notice: 'Storeditem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    send_file @storeditem.document.file.path, :x_sendfile=>true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storeditem
      @storeditem = current_user.storeditems.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def storeditem_params
      params.require(:storeditem).permit(:name, :document, :tag_list)
    end
end
