if Rails.env.test? 
    WillPaginate.per_page = 4
else
    WillPaginate.per_page = 9
end