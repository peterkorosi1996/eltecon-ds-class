data_file <- 'data/sales_sample.csv'
sales <- fread(data_file)
ggplot(sales, aes(x = purchase_date, y = quantity, colour = customer_lifecycle_status)) + geom_point()


