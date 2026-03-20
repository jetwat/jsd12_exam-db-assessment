-- Task 3: Staff Performance Review
-- At the end of the month, the owner wants to reward the hardest-working cashiers.
-- To decide fairly, they want to see how many orders each staff member has processed,
-- with the busiest staff member appearing at the top of the list.
--
-- Hint: Write a query to find the total number of orders processed by each staff member.
-- The result should show the staff member's full name (concatenated) and their total order count,
-- ordered by the count in descending order.

-- Bonus: The dataset is identical in the MongoDB database, meaning the same business insight can be retrieved.
-- Write the equivalent query for MongoDB. See query_task3_bonus.mongodb.js

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
-- โจทย์ต้องการ รู้ว่าสตาฟแต่ละคนทำไปคนละกี่ออเดอร์ เรียงจากคนทำมากไปน้อย
-- 
-- #### สิ่งที่ต้องการ:
-- - คอลัมน์: รหัสพนักงาน, ชื่อพนักงาน, ผลรวมของจำนวนออเดอร์
-- - เงื่อนไข: -
-- - เรียง: ผลรวมของจำนวนออเดอร์ จากมากไปน้อย
-- 
-- #### บันทึกการทำงาน:
-- -> น่าจะต้อง join และ count *-- ต้องใช้ order_id, staff_id จาก orders และ first_name, last_name, staff_id จาก staff*
-- -> เช็คเดิอนใน db ดูแล้ว เดือนเดียวกันหมด
--
--
-- -> ลองเขียนและรัน 
--    ```
-- SELECT
--     staff.staff_id AS "รหัสพนักงาน",
--     CONCAT(staff.first_name,' ',staff.last_name) AS "ชื่อพนักงาน",
--     COUNT(orders.order_id) AS "ผลรวมของจำนวนออเดอร์"
-- FROM public.staff 
-- JOIN orders ON staff.staff_id = orders.staff_id
-- GROUP BY staff.staff_id, CONCAT(staff.first_name,' ',staff.last_name)
-- ORDER BY COUNT(orders.order_id);
--    ``` *-- ลืมใส่ DESC*
--
--
-- -> เพิ่ม DESC 
--    ```
SELECT
    staff.staff_id AS "รหัสพนักงาน",
    CONCAT(staff.first_name,' ',staff.last_name) AS "ชื่อพนักงาน",
    COUNT(orders.order_id) AS "ผลรวมของจำนวนออเดอร์"
FROM public.staff 
JOIN orders ON staff.staff_id = orders.staff_id
GROUP BY staff.staff_id, CONCAT(staff.first_name,' ',staff.last_name)
ORDER BY COUNT(orders.order_id) DESC;
--    ``` *-- ผลลัพธ์โอเค*
