class CalciController < ApplicationController

	def new
		if params[:number1] or params[:number2]
			@num1=params[:number1].to_i
			@num2=params[:number2].to_i
			@sum=@num1+@num2
			@sub=@num1-@num2
			@multi=@num1*@num2
			@divi=(@num1/@num2).to_f
			@avg=((@num1+@num2)/2).to_f
		end
	end


	def calculator
		if params[:number1] or params[:number2]
			@num1=params[:number1].to_i
			@num2=params[:number2].to_i
			@sum=@num1+@num2
			@sub=@num1-@num2
			@multi=@num1*@num2
			@divi=(@num1/@num2).to_f
			@avg=((@num1+@num2)/2).to_f
		end
	end

end
