# Jest คืออะไร?
Jest เป็น JavaScript Framework สำหรับเอาไว้เขียน Test เป็น Open Source ที่พัฒนาโดย Facebook ซึ่งมี helper มี function ต่างๆ ให้เราใช้ ทำให้ง่ายต่อการเขียน Test มากๆ สามารถเขียนเทสได้ทั้ง React, Vue, Angular หรือ JavaScript ทั่วๆไป เรียกว่ามือใหม่หัดเทส ก็เข้าใจได้ครับ

## ข้อดีคือ

- ไม่ต้อง Config อะไรเลย แค่ติดตั้ง Jest
- มี Snapshop test
- Mock function หรือ spy ได้ (มีอธิบายเพิ่มเติมในบทความ)

## Getting Started
Download nodejs ติดตั้งบนเครื่องก่อน 

Download [Link](https://nodejs.org/en)

ใช้คำสั่ง ตรวจสอบ version
```sh
node -v
```

- เริ่มต้นโดยการสร้างโปรเจ็คขึ้นมาก่อน ผมใช้ ชื่อว่า jest-101 จากนั้น init มันด้วย npm

```sh

mkdir jest-101 && cd jest-101
npm init

```
จากนั้นทำการติดตั้ง Jest


```sh

npm install -g jest --save-dev

```
จากนั้นในส่วน scripts ของ package.json เพิ่ม test ลงไป เพื่อรัน jest

```json
{
  "scripts": {
    "test": "jest"
  }
}

```
ทดสอบรัน test ง่ายๆด้วยคำสั่ง

```sh

npm test

```

โฟลเดอร์เทสเรา จะไว้ในชื่อ __tests__ ก็ได้ หรือไว้ข้างนอกก็ได้เช่นกัน ขอแค่มีชื่อ .spec หรือ .test ต่อท้าย โดยเราสามารถตั้งชื่อได้โดยใช้ชื่อไฟล์ต่อท้าย เช่น app.test.js หรือ app.spec.js

เริ่มต้น Test แรก

สร้างไฟล์ app.js ขึ้นมา

```js

exports.getScore = (score) => {
    if (score >= 90) {
        return 'A';
    } else if (score >= 80) {
        return 'B';
    } else if (score >= 70) {
        return 'C';
    } else if (score >= 60) {
        return 'D';
    } else {
        return 'F';
    }
};

```

สร้างไฟล์ app.test.js ขึ้นมา


```js

const { getScore } = require('./app')

describe('getScore', () => {
  it('should get A', () => {
    expect(getScore(90)).toEqual('A');
    expect(getScore(100)).toEqual('A');
  });

  it('should get B', () => {
    expect(getScore(80)).toEqual('B');
    expect(getScore(89)).toEqual('B');
  });

  it('should get C', () => {
    expect(getScore(70)).toEqual('C');
    expect(getScore(79)).toEqual('C');
  });

  it('should get D', () => {
    expect(getScore(60)).toEqual('D');
    expect(getScore(69)).toEqual('D');
  });

  it('should get F', () => {
    expect(getScore(0)).toEqual('F');
    expect(getScore(59)).toEqual('F');
  });
});


it('should get A out', () => {
  expect(getScore(90)).toEqual('A');
  expect(getScore(100)).toEqual('A');
});

```

ทดสอบรัน test ดู

```sh

npm test

```

ใน **JavaScript Testing Frameworks** (เช่น Jest หรือ Mocha):

### **`describe`**
- ใช้สำหรับจัดกลุ่ม **test cases** ที่เกี่ยวข้องกัน.
- เป็นเพียงตัวช่วยในการทำให้โครงสร้างของเทสต์ดูเป็นระเบียบ และง่ายต่อการอ่านและเข้าใจ.
- ไม่ได้รันการทดสอบใดๆ ด้วยตัวมันเอง.
- สามารถซ้อน **`describe`** ไว้ในอีก **`describe`** ได้ (nested structure) เพื่อจัดการเทสต์ที่ซับซ้อน.

#### ตัวอย่าง:
```javascript
describe('Math Functions', () => {
    describe('Addition', () => {
        it('should add two positive numbers', () => {
            expect(1 + 2).toBe(3);
        });

        it('should add a positive and a negative number', () => {
            expect(1 + (-1)).toBe(0);
        });
    });

    describe('Subtraction', () => {
        it('should subtract two positive numbers', () => {
            expect(3 - 2).toBe(1);
        });
    });
});
```
- **กลุ่ม Math Functions**:
  - มีกลุ่มย่อย **Addition** และ **Subtraction**.
  - แต่ละกลุ่มมี **`it`** เป็นตัวทดสอบ.

---

### **`it`**
- ใช้สำหรับนิยาม **test case** แต่ละตัว.
- เป็นคำสั่งที่บอกว่า: "นี่คือสิ่งที่ระบบควรทำ" หรือ "This is what the system **should do**".
- ใช้สำหรับเขียนการคาดการณ์ (assertion) ที่ต้องตรวจสอบ.

#### ตัวอย่าง:
```javascript
it('should return the correct sum', () => {
    expect(1 + 2).toBe(3);
});
```
- เทสต์นี้ตรวจสอบว่าผลรวมของ `1 + 2` เท่ากับ `3`.

---

### **เปรียบเทียบ `describe` และ `it`**
| **ลักษณะ**            | **`describe`**                  | **`it`**                           |
|------------------------|---------------------------------|-------------------------------------|
| **หน้าที่**            | จัดกลุ่ม test cases            | เขียน test case แต่ละตัว            |
| **โครงสร้าง**         | ใช้สำหรับจัดกลุ่ม              | ใช้สำหรับนิยามว่าระบบควรทำอะไร      |
| **การทำงาน**          | ไม่รันเอง                      | รัน test case                      |
| **การซ้อน**           | ซ้อน `describe` ใน `describe` ได้ | ไม่แนะนำให้ซ้อนกัน                 |

---

### ตัวอย่างการทำงานร่วมกัน
```javascript
describe('String functions', () => {
    it('should return the correct length', () => {
        expect('hello'.length).toBe(5);
    });

    it('should convert string to uppercase', () => {
        expect('hello'.toUpperCase()).toBe('HELLO');
    });
});
```

**สรุป**:
- ใช้ `describe` เพื่อสร้างกลุ่มคำอธิบาย.
- ใช้ `it` เพื่อเขียนแต่ละกรณีทดสอบในกลุ่มนั้น.