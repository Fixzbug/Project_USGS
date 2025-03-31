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

### 🛠 ทำให้ **PM2** รันเซิร์ฟเวอร์อัตโนมัติ (Auto-Start)

PM2 เป็น **Process Manager** สำหรับ Node.js ที่ช่วยให้แอปสามารถรันต่อไปได้ แม้ว่าเซิร์ฟเวอร์จะรีสตาร์ท

---

## 🚀 1️⃣ ติดตั้ง PM2

ถ้ายังไม่ได้ติดตั้ง PM2 ให้ติดตั้งก่อน:

```bash
npm install -g pm2
```

---

## 🚀 2️⃣ รันโปรเจคของคุณด้วย PM2

ใช้คำสั่งนี้เพื่อให้ PM2 รัน **index.js** และ **server.js** พร้อมกัน:

```bash
pm2 start index.js --name "udp-server"
pm2 start server.js --name "http-server"
```

ตรวจสอบว่าโปรเซสทำงานอยู่:

```bash
pm2 list
```

---

## 🚀 3️⃣ ทำให้ PM2 รันอัตโนมัติหลังรีบูตเซิร์ฟเวอร์

ใช้คำสั่งนี้:

```bash
pm2 save
pm2 startup
```

📌 **PM2 จะสร้างคำสั่งให้ระบบทำงานอัตโนมัติหลังบูตเครื่อง**  
ให้คัดลอกคำสั่งที่แสดงขึ้นมา แล้วรันอีกครั้ง

ตัวอย่าง:

```bash
sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u your_user --hp /home/your_user
```

---

## 🚀 4️⃣ รีบูตเครื่อง แล้วตรวจสอบว่า PM2 รันอัตโนมัติ

รีสตาร์ทเซิร์ฟเวอร์:

```bash
sudo reboot
```

หลังจากบูตเครื่องใหม่ ให้ตรวจสอบ PM2 ว่ายังรันอยู่หรือไม่:

```bash
pm2 list
```

---

## 🚀 5️⃣ ใช้คำสั่งจัดการ PM2

### 🔄 รีสตาร์ทกระบวนการ

```bash
pm2 restart all
```

หรือรีสตาร์ทเฉพาะเซิร์ฟเวอร์:

```bash
pm2 restart udp-server
pm2 restart http-server
```

### ❌ หยุดกระบวนการ

```bash
pm2 stop all
```

หรือหยุดเฉพาะ:

```bash
pm2 stop udp-server
```

### 🗑 ลบกระบวนการ

```bash
pm2 delete all
```

หรือ:

```bash
pm2 delete udp-server
```

---

## 🎯 สรุป

✅ ใช้ **PM2** ให้รัน **index.js** และ **server.js** อัตโนมัติ  
✅ รันหลังรีบูตเครื่อง  
✅ ใช้คำสั่ง `pm2 list`, `pm2 restart`, `pm2 stop`, `pm2 delete` จัดการเซิร์ฟเวอร์

---
