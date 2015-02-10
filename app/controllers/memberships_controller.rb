class MembershipsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  def index
    @memberships = Membership.all
  end

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new
    if @membership.save(membership_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @membership.update(membership_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @membership.destroy
      redirect_to membership_path
    end
  end

  private

  def set_membership
    @membership = Membership.find(params[:edit])
  end

  def membership_params
    params.require(:membership).permit(:member_email, :amount, :quid)
  end

end