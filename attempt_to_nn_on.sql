
-- select `order_number`,`old_order_id` from `old_orders` order by `order_number`
-- SELECT old_order_id as terminal_number
-- FROM   old_orders
-- WHERE  old_order_id=(SELECT MAX(old_order_id)
   --            FROM old_orders
      --        WHERE order_number=(select order_number) );
      
(select `order_number`,`old_order_id` from `old_orders`)