import { getTrends } from "../repositories/trends.repository.js";

async function listTrends (req, res) {
    try {
        const trends = (await getTrends()).rows;

        return res.status(200).send(trends);
    } catch (error) {
        return res.status(500).send(error);
    }
}

export {
    listTrends,

}