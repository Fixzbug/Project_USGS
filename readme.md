### ⏰ ใช้ `pm2` + `--cron` รันตามเวลาที่กำหนด

```bash
pm2 start server.js --name usgs-earthquake-bot --cron "*/10 * * * *"

// 🚀 เรียกใช้งาน
(async () => {
    const now = dayjs().utc();
    const startTime = now.startOf('day').format(); // 00:00:00 UTC
    const endTime = now.format();                 // เวลาปัจจุบัน UTC
    const minMagnitude = 5.0;
    const limit = 5;

    const data = await fetchEarthquakeData({
        startTime,
        endTime,
        minMagnitude,
        limit
    });

    await displayEarthquakeInfo(data);
})();

```

💡 ตัวนี้จะให้ `pm2` เรียก `server.js` ใหม่ทุก 10 นาที (ไม่ต้องใช้ loop)

---

## 🧭 สรุปแนะนำ

| วิธี          | ทำงานยังไง                 | เหมาะสำหรับ                          |
| ------------- | -------------------------- | ------------------------------------ |
| `setInterval` | รันวนใน process เดียว      | งานเล็ก ๆ, บอทที่ online ตลอด        |
| `pm2 --cron`  | รันไฟล์ใหม่ทุกครั้งตามเวลา | สคริปต์ที่โหลดข้อมูล, ทำงานเป็นรอบ ๆ |

---
