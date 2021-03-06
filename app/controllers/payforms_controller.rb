class PayformsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@payforms = Payform.order :id
	end

	def new
		@payform = Payform.new
	end

	def create
		@payform = Payform.new(payform_params)

		if @payform.save
			flash[:notice] = "Pagamento criado com sucesso."
			redirect_to payforms_path
		else
			flash[:notice] =  "Erro ao gravar o pagamento :#{@payform.errors.full_messages.join}"
			redirect_to new_payform_path
		end
	end

	def edit
		busca_payform
	end

	def update
		busca_payform
		valores = payform_params
		if @payform.update(valores)
  			flash[:notice] = "Pagamento atualizado com sucesso"
  			redirect_to payforms_path
		else
  			#render action: "edit"
  			render :edit
		end
	end

	def destroy
	    id = params[:id]
	    if Payform.destroy id
	    	flash[:notice] = "Pagamento deletado"
	    	redirect_to payforms_path
	    end
	end

	def show
		busca_payform
	end

	private	
	def busca_payform
		@payform = Payform.find(params[:id])
	end

	def payform_params
      params.require(:payform).permit(:form)
    end

	# Criar as actions new, create, edit, update e delete
end
