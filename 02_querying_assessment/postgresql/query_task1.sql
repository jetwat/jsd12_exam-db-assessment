-- Task 1: Sides Menu Board
-- The owner wants to update the printed menu board that displays only the side dishes.
-- They need a list of every item in the 'Side' category along with its current price,
-- so the designer can produce an accurate board without having to check each item manually.
--
-- Hint: Write a query to find the name and price of all menu items that are in the 'Side' category.

-- Bonus: The dataset is identical in the MongoDB database, meaning the same business insight can be retrieved.
-- Write the equivalent query for MongoDB. See query_task1_bonus.mongodb.js

-- ---------------------------------------------------------------
-- Your thinking process (required)
-- ---------------------------------------------------------------
-- Before writing your query, explain in your own words how you
-- interpreted the task, what data you need, which table(s) are
-- involved, and what SQL concepts you plan to use.
-- Write in English or Thai. Do not skip this step.
-- 
-- ---------------------------------------------------------------
-- Your thinking:
-- 
-- โจทย์ต้องการให้ลิสต์เมนูที่เป็นไซด์ดิช พร้อมกับราคา
-- 
-- #### สิ่งที่ต้องการ:
-- - คอลัมน์: menu_name, price
-- - เงื่อนไข: category = "Side"
-- 
-- #### บันทึกการทำงาน:
-- -> เปิด vs code อีก windows เพื่อดูข้อมูลแต่ละตารางคร่าว ๆ ด้วยการ `ไปที่ extension → select top 1000 แต่ละตาราง → open as new tab` จะได้ดูง่าย ๆ
-- -> ไปเช็คตารางว่าต้องมีการจอยไหม *-- ใช้แค่ public.menuitems ก็น่าจะพอ*
-- -> ไปเช็ค create_tables.sql อีกทีเพื่อความชัวร์ *-- ok, ID เป็น PK*
-- -> ลองเขียนและรัน 
--    ```
-- SELECT
--     a.name AS "Menu_Name",
--     a.price AS "Menu_Price"
-- FROM public.menuitems a
-- WHERE a.category = "Side"; 
--    ```
--    -- error: column "Side" does not exist
-- -> ใช้ Double Quotes ครอบค่าไม่ได้ เปลี่ยนเป็น Single Quotes
-- -> ลองเขียนและรัน 
--    ```
SELECT
    a.name AS "Menu_Name",
    a.price AS "Menu_Price"
FROM public.menuitems a
WHERE a.category = 'Side'; 
--    ``` -- ผลลัพธ์โอเค


