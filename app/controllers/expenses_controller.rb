class ExpensesController < ApplicationController
  def index
    @expenses = Expense.order("date DESC")
    @expenses= @expenses.where(category_id: params[:category_id]) unless !params[:category_id].present?   
    @expenses= @expenses.where('concept LIKE ?',"%#{params[:concept]}%") unless !params[:concept].present?    
  end
end
