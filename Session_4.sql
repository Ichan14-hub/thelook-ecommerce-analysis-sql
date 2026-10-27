## Contoh 1 aggregat
SELECT 
  status, # Non aggregat 
  COUNT(*) as jumlah_order ## Aggregat
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY 1
HAVING COUNT(*) > 20000
ORDER BY 2 DESC;


## Contoh 2 Aggregat
SELECT 
  status, # Non aggregat 
  COUNT(*) as jumlah_order, ## Aggregat
  sum(num_of_item) as jumlah_item
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY 1
HAVING COUNT(*) > 20000 AND sum (num_of_item) > 2000
ORDER BY 2 DESC;


## Filter menggunakan pembatasan tanggal 
SELECT 
  status, # Non aggregat 
  COUNT(*) as jumlah_order, ## Aggregat
  sum(num_of_item) as jumlah_item
FROM `bigquery-public-data.thelook_ecommerce.orders`
where created_at between '2024-01-01' and '2025-01-01'
GROUP BY 1
HAVING COUNT(*) > 2000 AND sum (num_of_item) > 5000
ORDER BY 2 DESC;

### Mencari produk terlaris

SELECT
  product_id,
  COUNT(*) AS item_rows
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY 1
ORDER BY item_rows DESC
LIMIT 10;


### Untuk mengetahui jumlah user
SELECT
  count(*) as jumlah_users
FROM `bigquery-public-data.thelook_ecommerce.users`;

### Untuk mengetahui jumlah user per-negara
SELECT country, COUNT(*) AS customer_records
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY country
ORDER BY customer_records DESC
LIMIT 10;

### Untuk melihat perbandingan performa penjualan berdasarkan status perstatus

SELECT
  status, 
  COUNT(*) AS total_items,
  COUNT(DISTINCT order_id) AS total_orders,
  Round(SUM(sale_price),2) as total_sales,
  Round(AVG(sale_price),2) as avg_sales
  FROM bigquery-public-data.thelook_ecommerce.order_items
  group by 1
  order by 2 DESC;

#Untuk menghitung jumlah user
  SELECT COUNT(DISTINCT user_id) as jumlah_user
  FROM `bigquery-public-data.thelook_ecommerce.orders`;

##Untuk memperhitungkan sales
  SELECT 
    SUM(sale_price) AS total_item_sales
  FROM `bigquery-public-data.thelook_ecommerce.order_items`;



#Untuk mengetahui harga rata-rata perkategori
SELECT
    category,
    COUNT(*) AS total_products,
    ROUND(AVG(retail_price), 2) AS avg_retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY category
ORDER BY avg_retail_price DESC;


#### Untuk menghitung total order per status
SELECT
  status, 
  COUNT(*) AS total_orders
  FROM `bigquery-public-data.thelook_ecommerce.orders`
  Group by 1
  Order by 1 DESC;

## Untuk menghitung top 10
SELECT country, COUNT(*) AS total_users
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY country
ORDER BY total_users DESC
Limit 10;
