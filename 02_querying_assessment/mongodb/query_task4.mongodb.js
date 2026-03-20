// Task 4: Total Revenue Summary
// At the end of the trading period, the owner wants a single figure that shows how much revenue
// the truck has generated across all recorded orders. This number will be used in their
// financial summary report, so the result should be returned as a single value named total_revenue.
//
// Hint: Write an aggregation query on the orders collection to calculate the total revenue from all orders combined.
// The result should be a single document with a field named total_revenue.

// Bonus: The dataset is identical in the PostgreSQL database, meaning the same business insight can be retrieved.
// Write the equivalent query for PostgreSQL. See query_task4_bonus.sql

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
// โจทย์ต้องการ แค่ total_revenue เท่านั้น ต้อง summary มา อาจต้องดูเพิ่มว่า trading period คือทั้งหมดหรือเปล่า
//
// #### สิ่งที่ต้องการ:
// - ฟีลด์: total_revenue
// - เงื่อนไข: ต้อง sum ทุก order
//
// #### บันทึกการทำงาน:
// -> เข้าไปดู collection: orders *-- น่าจะไม่ต้องฟิลเตอร์วันที่ ต้องใช้แค่ fields: total_price*
// -> เปิด docs หา ฟังก์ชัน sum *-- น่าจะต้องใช้ $group ใต้ .aggregate
//
// -> ลองเขียนและรัน
//    ```
//use("chrome-burger-db");
// db.orders.aggregate(
//   { $match: {} },
//   { $group: { _id: 0, total_revenue: { $sum: "$total_price" } } },
// );
//    ``` *-- ผลลัพธ์น่าจะโอเค แต่จะลองใช้แค่ $group อย่างเดียว*
//
// -> ลองเขียนและรันใหม่
//    ```
use("chrome-burger-db");
db.orders.aggregate(
  {
    $group: { _id: null, total_revenue: { $sum: "$total_price" } },
  },
  {
    $project: { _id: 0, total_revenue: 1 },
  },
);
//    ``` *-- ผลลัพธ์โอเค*
