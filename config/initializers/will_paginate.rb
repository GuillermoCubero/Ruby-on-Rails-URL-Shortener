if Rails.env.test? 
    WillPaginate.per_page = 1
else
    WillPaginate.per_page = 9
end