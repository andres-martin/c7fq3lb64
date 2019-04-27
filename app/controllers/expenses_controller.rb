class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def index
    redirect_to sign_in_path unless user_signed_in?  
    
    @expenses = Expense.order("date DESC")
    @expenses = Expense.where("user_id = ?", current_user)
    @expenses= @expenses.where(category_id: params[:category_id]) unless !params[:category_id].present?   
    @expenses= @expenses.where('concept LIKE ?',"%#{params[:concept]}%") unless !params[:concept].present?    
  end
end
