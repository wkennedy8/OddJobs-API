module JobCategories 
    class ContractorsController < ApplicationController
        
        def index
            category = JobCategory.includes(:contractors).find(params[:job_category_id])

            render json: {contractors: category.contractors}
        end
    end
end
