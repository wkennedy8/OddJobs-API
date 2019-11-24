module JobCategories 
    class ContractorsController < ApplicationController
        
        def index
            category = JobCategory.includes(:contractors).find(params[:job_category_id])

            render json: {
                contractors: category.contractors.map do |contractor|
                    {
                        id: contractor.id,
                        first_name: contractor.first_name,
                        last_name: contractor.last_name,
                        background_check: contractor.background_check,
                        contractor_image: contractor.contractor_image.url,
                    }
                end
            }
        end
    end
end
