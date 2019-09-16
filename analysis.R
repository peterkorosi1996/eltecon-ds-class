
library(ggplot2)
library(data.table)
data_file <- 'data/sales_sample.csv'
sales <- fread(data_file)


contact_id2 <- sales$contact_id[1:100]
order_id2 <- sales$order_id[1:100]
purchase_date2 <- sales$purchase_date[1:100]
sales_amount2 <- sales$sales_amount[1:100]
quantity2 <- sales$quantity[1:100]
customer_lifecycle_status2 <- sales$customer_lifecycle_status[1:100]
dataframe2 <- data.frame(contact_id2, customer_lifecycle_status2, order_id2, purchase_date2, quantity2, sales_amount2)


ggplot(dataframe2, aes(x = contact_id2, y = quantity2, colour = sales_amount2)) + geom_point()
