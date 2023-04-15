class ApplicationController < ActionController::Base
  def blank_square_form

    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square
    # params = {"entry=42"}

    @num = params.fetch("entry").to_f

    @square_of_num = @num ** 2

    render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def blank_random_form

    render({ :template => "calculation_templates/random_form.html.erb" })
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render({ :template => "calculation_templates/rand_results.html.erb" })
  end

  def blank_square_root

    render({ :template => "calculation_templates/square_root_form.html.erb" })
  end

  def calculate_square_root

    @number = params.fetch("input").to_f

    @square_root_of_number = Math.sqrt(@number)

    render({ :template => "calculation_templates/square_root_results.html.erb" })
  end

  def blank_payment_form

    render({ :template => "calculation_templates/payment_form.html.erb" })    
  end

  def calculate_payment
    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_f
    @principal = params.fetch("user_pv").to_f

    n = @years * 12
    r = @apr / 100 / 12
    numerator = r * @principal
    denominator = 1 - (1 + r) ** -n
    @payment = numerator / denominator

    render({ :template => "calculation_templates/payment_results.html.erb" })
  end
end
