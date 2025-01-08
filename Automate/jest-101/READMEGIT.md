การใช้งาน Git แบบพื้นฐานจะครอบคลุมกระบวนการต่าง ๆ เช่น การสร้าง repository, การเพิ่มไฟล์, การ commit, และการ push ไปยัง remote repository (เช่น GitHub หรือ GitLab) ตัวอย่างดังนี้:

---

### 0. **การ clone**
clone แบบ auto select branch mater

```bash
git clone https://github.com/username/repository.git
```

clone แบบ select branch โดยระบุ Automate001
```bash
git clone https://github.com/username/repository.git -b Automate001
```

### 1. **ตั้งค่า Git ครั้งแรก**
ก่อนเริ่มใช้งาน Git ให้ตั้งค่าชื่อผู้ใช้และอีเมลของคุณ:
```bash
git config --global user.name "Your Name"
git config --global user.email "youremail@example.com"
```

### 2. **สร้าง Repository**
สร้าง repository ใหม่ในโฟลเดอร์ปัจจุบัน:
```bash
git init
```

### 3. **เพิ่มไฟล์ไปยัง Staging Area**
เพิ่มไฟล์ทั้งหมดในโฟลเดอร์ปัจจุบัน:
```bash
git add .
```

### 4. **บันทึกการเปลี่ยนแปลง (Commit)**
บันทึกไฟล์ที่เพิ่มเข้ามาพร้อมข้อความอธิบาย:
```bash
git commit -m "Initial commit"
```

### 5. **เชื่อมต่อกับ Remote Repository**
เชื่อมต่อ repository ของคุณกับ remote เช่น GitHub:
```bash
git remote add origin https://github.com/username/repository.git
```

### 6. **ส่งไฟล์ไปยัง Remote Repository (Push)**
ส่งการเปลี่ยนแปลงไปยัง branch `main` (หรือ `master`):
```bash
git push -u origin [Automate001, Automate002]
```

### 7. **อัพเดต Repository (Pull)**
ดึงข้อมูลล่าสุดจาก remote:
```bash
git pull
```

### 8. **ดูสถานะ**
ตรวจสอบสถานะปัจจุบันของ repository:
```bash
git status
```

### 9. **ดูประวัติการ Commit**
ดูประวัติการเปลี่ยนแปลง:
```bash
git log
```


การสร้างและใช้งาน **branch** ใน Git เป็นเรื่องสำคัญสำหรับการแยกการทำงานออกจาก branch หลัก (เช่น `main` หรือ `master`) เพื่อลดความเสี่ยงในการแก้ไขโค้ดหลัก และช่วยจัดการงานได้ง่ายขึ้น

### ขั้นตอนการสร้างและใช้งาน Branch

---

### 1. **สร้าง Branch ใหม่**
ใช้คำสั่ง `git branch` เพื่อสร้าง branch ใหม่:
```bash
git branch ชื่อ-branch
```
---

### 2. **สลับไปยัง Branch ใหม่**
ใช้คำสั่ง `git checkout` หรือคำสั่งย่อ `git switch`:
```bash
git checkout ชื่อ-branch
```
---

### 3. **สร้าง Branch และสลับไปยัง Branch นั้นทันที**
คำสั่งเดียวเพื่อสร้างและสลับไปยัง branch:
```bash
git checkout -b ชื่อ-branch
```
---

### 4. **แสดง Branch ทั้งหมด**
ตรวจสอบ branch ที่มีอยู่:
```bash
git branch
```
ผลลัพธ์จะมี `*` ข้างหน้าชื่อ branch ที่กำลังทำงานอยู่

---

ตัวอย่างเช่น:
```bash
git help commit
```
