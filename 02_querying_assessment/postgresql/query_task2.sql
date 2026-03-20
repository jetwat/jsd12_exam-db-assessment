-- Task 2: Kitchen Staff Contact List
-- The manager has a last-minute change to the kitchen prep schedule and needs to notify
-- all cooks as soon as possible. They need the full names of every staff member
-- whose role is 'Cook' so they can be contacted directly.
--
-- Hint: Write a query to list the first_name and last_name of all staff members whose role is 'Cook'.

-- Bonus: The dataset is identical in the MongoDB database, meaning the same business insight can be retrieved.
-- Write the equivalent query for MongoDB. See query_task2_bonus.mongodb.js

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
-- โจทย์ต้องการ ชื่อจริงนามสกุลของกุ๊กทั้งหมด
-- 
-- #### สิ่งที่ต้องการ:
-- - คอลัมน์: ชื่อพนักงาน
-- - เงื่อนไข: ตำแหน่ง = "cook"
-- 
-- #### บันทึกการทำงาน:
--
-- -> เอาตัวอย่างข้อมูลไปวางใน /sample_db.excalidraw จะได้มองภาพรวมง่ายขึ้น
-- -> เช็คตารางว่าต้องจอยไหม *-- public.staff อย่างเดียวพอ*
--
-- -> ลองเขียนและรัน 
--    ```
-- SELECT
--     a.first_name || a.last_name AS "Full_Name"
-- FROM public.staff a
-- WHERE a.role = 'Cook'; 
--    ``` *-- ลืมเว้นวรรค*
--
-- -> ลองเขียนและรัน concat แทน 
--    ```
-- SELECT
--     CONCAT(a.first_name,' ',a.last_name) AS "Full_Name"
-- FROM public.staff a
-- WHERE a.role = 'Cook'; 
--    ``` *-- เพิ่มรหัสพนักงานดีกว่า เผื่อชื่อซ้ำ*
--
-- -> ลองเขียนและรัน  
--    ```
SELECT
    a.staff_id AS "รหัสพนักงาน",
    CONCAT(a.first_name,' ',a.last_name) AS "Full_Name"
FROM public.staff a
WHERE a.role = 'Cook'; 
--    ``` *-- ผลลัพธ์โอเค*