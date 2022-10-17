import { connection } from "../database/db.js";

const getRanking = async (req, res) => {
	try {
		const ranking = await connection.query(
			`SELECT u.id,u.name,COUNT(ur.*) AS "linksCount", COALESCE(SUM(ur."visitCount"),0) AS "visitCount"  
            FROM users u LEFT JOIN urls ur ON u.id = ur."userId" GROUP BY u.id ORDER BY "visitCount" DESC,"linksCount" DESC;`
		);
		if (ranking.rows.length !== 0) {
			ranking.rows.forEach((user) => {
				user.linksCount = Number(user.linksCount);
				user.visitCount = Number(user.visitCount);
			});
		}
		res.send(ranking.rows);
	} catch {
		res.sendStatus(500);
	}
};
export { getRanking };
