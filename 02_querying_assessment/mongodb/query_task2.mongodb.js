// Task 2: Shift Activity Report
// Jane Doe has an upcoming performance review and the manager wants to look at her order history
// ahead of the meeting. They only need to see when each order was placed and what it was worth —
// no other details are required for this particular review.
//
// Hint: Write a query to find all orders handled by the staff member "Jane Doe".
// Your query should only return the order_date and total_price fields for these orders.

// Bonus: The dataset is identical in the PostgreSQL database, meaning the same business insight can be retrieved.
// Write the equivalent query for PostgreSQL. See query_task2_bonus.sql

// ---------------------------------------------------------------
// Your thinking process (required)
// ---------------------------------------------------------------
// Before writing your query, explain in your own words how you
// interpreted the task, what data you need, which collection(s)
// are involved, and what MongoDB concepts you plan to use.
// Write in English or Thai. Do not skip this step.
//
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// Your thinking:
//
// โจทย์ต้องการ ดูออร์เดอร์ที่ Jane Doe รับผิดชอบ โดยต้องการเห็นแค่ เวลาที่ออเดอร์เกิดและคุณค่า เท่านั้น
//
// #### สิ่งที่ต้องการ:
// - ฟีลด์: ออเดอร์เกิดและคุณค่า
// - เงื่อนไข: ผู้รับผิดชอบ = "Jane Doe"
//
// #### บันทึกการทำงาน:
// -> เปิด db ดู collection: orders ด้วย extension
// -> น่าจะต้องใช้ .find ฟีลด์ order_date, total_price, staff{ first_name, last_name} จากคอลเล็คชัน orders แล้วโปรเจ็กต์แค่เท่าที่จำเป็น
//
// -> ลองเขียนและรัน
//    ```
// use("chrome-burger-db");
// db.orders.find(
//   { staff: { first_name: "Jane", last_name: "Doe" } },
//   { _id: 0, order_date: 1, total_price: 1 },
// );
//    ``` *-- ผลลัพธ์ไม่โอเค ต้องเปลี่ยนเป็น staff.xxx*
//
// -> ลองเขียนและรันใหม่
//    ```
use("chrome-burger-db");
db.orders.find(
  { "staff.first_name": "Jane", "staff.last_name": "Doe" },
  { _id: 0, order_date: 1, total_price: 1 },
);
//    ``` *-- ผลลัพธ์โอเค*
