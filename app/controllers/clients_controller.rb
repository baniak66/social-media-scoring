class ClientsController < ApplicationController

  def start
  end

  def search
    @client = Client.find_by(email: params[:search])
    @likes = @client.list_likes
  end
end
