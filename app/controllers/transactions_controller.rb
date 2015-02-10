class TransactionsController < ApplicationController
  def create
    membership = Membership.find_by!(slug: params[:slug])
    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create (
        amount: membership.price,
        currency: "usd",
        card: token,
        description: current_user.email
      )

    @membership = Membership.create!(member_email: current_user.email)
    redirect_to root_path

    rescue Stripe::CardError => e

      @error = e

      redirect_to root_path, notice: @error
    end
  end
end
