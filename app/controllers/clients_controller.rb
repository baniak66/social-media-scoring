class ClientsController < ApplicationController

  def start
  end

  def search
    @client = Client.find_by(email: params[:search])
    @likes = @client.list_likes
  end

  def all
    @clients = Client.paginate(:page => params[:page], :per_page => 15)
  end
end
