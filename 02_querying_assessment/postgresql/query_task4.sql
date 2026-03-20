-- Task 4: Supplier Dependency Check
-- The manager has just heard that 'Freshest Farm Produce' may be delayed on their next delivery.
-- Before deciding whether to source from an alternative supplier, they need to know exactly
-- which ingredients depend on that supplier, so they can assess the impact on the menu.
--
-- Hint: Write a query to find the names of all ingredients supplied by 'Freshest Farm Produce'.

-- Bonus: The dataset is identical in the MongoDB database, meaning the same business insight can be retrieved.
-- Write the equivalent query for MongoDB. See query_task4_bonus.mongodb.js

-- ---------------------------------------------------------------
-- Your thinking process (required)
-- ---------------------------------------------------------------
-- Before writing your query, explain in your own words how you
-- interpreted the task, what data you need, which table(s) are
-- involved, and what SQL concepts you plan to use.
-- Write in English or Thai. Do not skip this step.
--
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
-- Your thinking:
-- 
-- โจทย์ต้องการ ทราบวัตถุดิบทั้งหมดที่ต้องเปลี่ยนซัพพลายเออร์ ซึ่งต้องรู้ว่า 'Freshest Farm Produce' ซัพพลายอะไรอยู่
-- 
-- #### สิ่งที่ต้องการ:
-- - คอลัมน์: FFP_Ingredients
-- - เงื่อนไข: supplier = 'Freshest Farm Produce'
-- 
-- #### บันทึกการทำงาน:
-- 
-- -> ไปดูชื่อคอลัมน์ *-- ต้องใช้ name, supplier_id จาก ingredients และ name, supplier_id จาก suppliers*  
--
-- -> ลองเขียนและรัน
--    ```
SELECT
    ingredients.name AS "FFP_Ingredients"
FROM ingredients 
JOIN suppliers ON ingredients.supplier_id = suppliers.supplier_id
WHERE suppliers.name = 'Freshest Farm Produce';
--    ``` *-- ผลลัพธ์โอเค*