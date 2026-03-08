const express = require('express');
const axios = require('axios');
const app = express();
app.use(express.json());

const PORT = process.env.PORT || 3000;
const ALCHEMY_URL = process.env.UPSTREAM_RPC_URL; // AlchemyのURL

// 1. 生存確認（Renderのスリープ防止 & dRPCのチェック用）
app.get('/', (req, res) => res.status(200).send('Node Active'));

// 2. RPCリクエストの中継（ここでお金が発生します）
app.post('/rpc', async (req, res) => {
    try {
        const response = await axios.post(ALCHEMY_URL, req.body, {
            headers: { 'Content-Type': 'application/json' },
            timeout: 5000 // 5秒で切断（無駄な通信を防止）
        });
        res.json(response.data);
    } catch (e) {
        // エラー時はdRPCに「今は無理」と伝え、他の人に仕事を回してもらう
        res.status(429).json({ error: "Rate limit or upstream error" });
    }
});

app.listen(PORT, () => console.log(`Provider node started on port ${PORT}`));
