class ClientsController < ApplicationController

  def start
  end

  def search
    if @client = Client.find_by(email: params[:search])
      @likes = @client.list_likes
    else
      flash[:warning] = "Podaj adres email"
      redirect_to root_path
    end
  end

  def all
    @clients = Client.paginate(:page => params[:page], :per_page => 15)
  end

  def delete
    Client.delete_all
    flash[:notice] = "Usunięto wszystkich klientów. Możesz teraz dodać nowych"
    redirect_to all_path
  end

  def upload
    if uploaded_io = params[:file]
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      clients = SmarterCSV.process(Rails.root + "public/uploads/test.csv")
      clients.each do |cli|
        Client.create!(
          email: cli[:email],
          first_name: cli[:first_name],
          last_name: cli[:last_name],
          phone: cli[:phone]
        )
      end
      Rails.application.load_seed
      redirect_to all_path
    else
      flash[:warning] = "Najpierw załaduj plik .csv"
      redirect_to root_path
    end
  end

  def facebook
    FacebookCrawler.search(params[:login], params[:pass], params[:email])
    redirect_to root_path
  end

end
