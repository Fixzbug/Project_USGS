const axios = require('axios');
const dayjs = require('dayjs');
const utc = require('dayjs/plugin/utc');
dayjs.extend(utc);

// 🔔 ฟังก์ชันส่งข้อความไปยัง Telegram
async function sendTelegramNotification(message) {
    const botToken = '8124269941:AAEtAIyWe8XQh6rt9_wMIBMPwopwYeWSJGM';      // ← ใส่ Bot Token ของคุณ
    const chatId = '5315801173';          // ← ใส่ Chat ID ของคุณ
    const url = `https://api.telegram.org/bot${botToken}/sendMessage`;

    try {
        await axios.post(url, {
            chat_id: chatId,
            text: message,
            parse_mode: "Markdown"  // ✅ เพื่อให้ลิงก์ทำงาน
        });
        console.log("✅ Sent notification to Telegram.");
    } catch (error) {
        console.error("❌ Failed to send Telegram message:", error.message);
    }
}

// 📦 ดึงข้อมูลจาก USGS
async function fetchEarthquakeData({
    startTime = null,
    endTime = null,
    minMagnitude = null,
    maxMagnitude = null,
    limit = 10
} = {}) {
    const baseUrl = "https://earthquake.usgs.gov/fdsnws/event/1/query";
    const params = {
        format: "geojson",
        starttime: startTime,
        endtime: endTime,
        minmagnitude: minMagnitude,
        maxmagnitude: maxMagnitude,
        limit: limit
    };

    try {
        const response = await axios.get(baseUrl, { params });
        return response.data;
    } catch (error) {
        console.error(`Error: Unable to fetch data. ${error.message}`);
        return null;
    }
}

// 📊 แสดงผลและส่งข้อความ
async function displayEarthquakeInfo(data) {
    if (!data || !data.features || data.features.length === 0) {
        console.log("No earthquake data available.");
        return;
    }

    console.log("Earthquake Information:");
    console.log("-".repeat(40));

    for (const feature of data.features) {
        const properties = feature.properties || {};
        const geometry = feature.geometry || {};
        const coordinates = geometry.coordinates || [null, null, null];

        const place = properties.place || "N/A";
        const magnitude = properties.mag || "N/A";
        const time = properties.time ? dayjs(properties.time).utc().format('DD/MM/YYYY HH:mm:ss') : "N/A";

        const message = `🌍 Earthquake Alert!\n` +
            `📍 Location: ${place}\n` +
            `💥 Magnitude: ${magnitude}\n` +
            `🕒 Time: ${time} UTC\n` +
            `📌 Coordinates: [Lat=${coordinates[1]}, Lon=${coordinates[0]}](https://www.google.com/maps?q=${coordinates[1]},${coordinates[0]})\n` +
            `📏 Depth: ${coordinates[2]} km`;

        console.log(message);
        console.log("-".repeat(40));

        await sendTelegramNotification(message); // ✅ ส่งเข้า Telegram
    }
}

// 🚀 เรียกใช้งาน
// (async () => {
//     const now = dayjs().utc();
//     const startTime = now.startOf('day').format(); // 00:00:00 UTC
//     const endTime = now.format();                 // เวลาปัจจุบัน UTC
//     const minMagnitude = 5.0;
//     const limit = 5;

//     const data = await fetchEarthquakeData({
//         startTime,
//         endTime,
//         minMagnitude,
//         limit
//     });

//     await displayEarthquakeInfo(data);
// })();

setInterval(async () => {
    const now = dayjs().utc();
    const startTime = now.startOf('day').format();
    const endTime = now.format();
    const minMagnitude = 5.0;
    const limit = 5;

    const data = await fetchEarthquakeData({
        startTime,
        endTime,
        minMagnitude,
        limit
    });

    await displayEarthquakeInfo(data);
}, 10 * 60 * 1000); // 10 นาที (10 * 60 วินาที * 1000 มิลลิวินาที)
