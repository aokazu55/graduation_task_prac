class ServicesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @service = Service.new
  end

  def create
    @service = current_user.services.build(service_params)
    if @service.save
      redirect_to service_path(@service), notice: "レシピを投稿しました。"
    else
      render :new
    end
  end

  def index
    @services = Service.all.order([:id])
  end



  def edit
    @service = Service.find(params[:id])
    if @service.user != current_user
        redirect_to services_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to service_path(@service), notice: "サービスを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    service = Service.find(params[:id])
    service.destroy
    redirect_to user_path(service.user), notice: "サービスを削除しました。"
  end

  private

  def service_params
    params.require(:service).permit(:main_service, :service_name, :price, :working_time, :period_start, :image, :period_end, :estimated_days_required, :remark, :transportation_expenses)
  end


end