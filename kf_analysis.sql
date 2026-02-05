SELECT
  ft.transaction_id,
  ft.date,
  ft.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating AS rating_cabang,
  ft.customer_name,
  ft.product_id,
  p.product_name,
  ft.price AS actual_price,
  ft.discount_percentage,

  CASE
    WHEN ft.price <= 50000 THEN 0.10
    WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
    WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
    WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
    ELSE 0.30
  END AS persentase_gross_laba,

  --Nett Sales:Harga Setelah Diskon(p.price * (1-t.discount_percentage/100.00)) AS nett_sales, 
--Nett Profit(p.price * (1-t.discount_percentage/100.0)) *
  CASE
    WHEN ft.price <= 50000 THEN 0.10
    WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
    WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
    WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
    ELSE 0.30
  END AS nett_profit,

 ft AS rating_transaksi,

FROM eternal-poetry-486413-h6.kimia_farma.kf_final_transaction ft
LEFT JOIN eternal-poetry-486413-h6.kimia_farma.kf_kantor_cabang kc
  ON ft.branch_id = kc.branch_id
LEFT JOIN eternal-poetry-486413-h6.kimia_farma.kf_product p
  ON ft.product_id = p.product_id;
