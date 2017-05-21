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

  def upload
    # csv_file = SmarterCSV.process(params[:file])
    # csv_file = params[:file]
    # puts csv_file

    # uploaded = params[:file]
    # puts csv_file.class
    # File.open(<insert_filename_here>, 'w') do |file|
    #   file.write(uploaded.read)
    # end

    uploaded_io = params[:file]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)

    end
    Rails.application.load_seed
    redirect_to all_path
  end

end
