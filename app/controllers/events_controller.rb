class Api::EmailSubscribersController < ApplicationController

  def index
    render json: { email_subscribers: EmailSubscriber.all}
  end

  def create
    newSubscriber = EmailSubscriber.create email_subscriber_params
    render json: { business: newSubscriber }

  end


  def destroy

  end

  private

  def email_subscriber_params
    params.require(:email_subscriber).permit(:email, :zipcode)
  end

end
