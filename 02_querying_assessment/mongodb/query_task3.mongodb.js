// Task 3: Stock Replenishment Check
// Before placing the weekly supply order, the manager wants to avoid over-ordering ingredients
// that are already well-stocked. They need a list of every ingredient with a stock level
// of 100 or more so those can be deprioritised in this week's order.
//
// Hint: Write a query to find all ingredients in the ingredients collection that have a stock_level of 100.00 or more.

// Bonus: The dataset is identical in the PostgreSQL database, meaning the same business insight can be retrieved.
// Write the equivalent query for PostgreSQL. See query_task3_bonus.sql

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
// อยากลองเขียนด้วย aggregation pipeline
// โจทย์ต้องการ หา ingredients ทั้งหมดที่ยอดคงคลังมากกว่าหรือเท่ากับ 100 ชิ้น
//
// #### สิ่งที่ต้องการ:
// - ฟีลด์: ingredients_name
// - เงื่อนไข: current_stock >= 100
//
// #### บันทึกการทำงาน:
// -> เข้าไปดู collection: ingredients *-- น่าจะต้องใช้ fields: name, stock_level, unit*
//
// -> ลองเขียนและรัน
//    ```
use("chrome-burger-db");
db.ingredients.aggregate(
  { $match: { stock_level: { $gte: 100 } } },
  { $project: { _id: 0, supplier_id: 0 } },
);
//    ``` *-- ผลลัพธ์โอเค*
