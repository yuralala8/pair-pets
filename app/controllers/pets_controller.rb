class PetsController < ApplicationController

	def index
		@pets = Pet.where(user_id: session[:user_id])
	end

	def new
		@pet = Pet.new
	end

	def create
		@pet = Pet.new(pet_params)
		@pet.user_id = session[:user_id]
		if @pet.save
			redirect_to pets_path
		else
			render :new
		end
	end

	def show
		@pet = Pet.find(params[:id])
	end

	def destroy
		@pet = Pet.find(params[:id])
		@pet.destroy
		redirect_to pets_path
	end


	private

	def pet_params
		params.require(:pet).permit(:name, :breed, :gender, :age)
	end
end