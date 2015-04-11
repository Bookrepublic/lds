class SponsorsController < InheritedResources::Base

  private

    def sponsor_params
      params.require(:sponsor).permit(:first_name, :last_name, :biography)
    end
end

