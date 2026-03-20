// Task 1: Budget Meal Deal
// The owner wants to introduce a budget-friendly meal deal promotion and needs to identify
// which menu items could be included. To qualify, an item must be priced under $10.00,
// so they can offer good value without cutting too deep into margins.
//
// Hint: Write a query to find all menu items in the menu_items collection that have a price less than 10.00.

// Bonus: The dataset is identical in the PostgreSQL database, meaning the same business insight can be retrieved.
// Write the equivalent query for PostgreSQL. See query_task1_bonus.sql

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
// โจทย์ต้องการ ลิสต์เมนูที่ราคาต่ำกว่า 10 ดอล
//
// #### สิ่งที่ต้องการ:
// - ฟีลด์: menu_name, price
// - เงื่อนไข: price < 10
//
// #### บันทึกการทำงาน:
//
// -> ไปดูไฟล์ที่สร้าง collections และ documents *-- ลองพยายามดูความสัมพันธ์ระหว่างแต่ละ collection แล้วโน้ตไว้ใน .excalidraw*
// -> หาฟีลด์และคอเลคชันที่ต้องใช้ *-- น่าจะต้องใช้ feilds: name, price และ collection: menu_items *
// -> คิดว่าต้องใช้ .find แต่ลืมวิธีการใส่ condition เลยต้องไปเปิด docs *-- น่าจะต้องใช้ {price: {$lt: 10}}*
//
// -> ลองเขียนและรัน
//    ```
//    db.menu_items.find({ price: { $lt: 10 } }, { name: 1, price: 1 });
//    ``` *-- ไม่เจอผลลัพธ์ เพราะลืม เลือก Database ที่ต้องการใช้งานก่อน*
//
// -> ลองเขียนและรันใหม่
//    ```
use("chrome-burger-db");
db.menu_items.find({ price: { $lt: 10 } }, { _id: 0, name: 1, price: 1 });
//    ``` *-- ผลลัพธ์โอเค*
