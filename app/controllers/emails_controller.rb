class EmailsController < ApplicationController
	def index
	  @emails = Email.all 
	end



	  def create
    @email = Email.create(body: Faker::Lorem.paragraph, object: Faker::Book.title)
    respond_to do |format|
      format.html { redirect_to email_path(email) }      
      format.js { }
    end
  end 

  def show
     @email = Email.find(params[:id])
  end


	private

	def email_params
	  params.permit(:object, :body)
	end

end