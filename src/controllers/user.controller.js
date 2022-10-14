import { connection } from "../database/db.js";

const getUserData = async (req, res) => {
	const userId = res.locals.userId;
	try {
		const userUrls = await connection.query(
			`SELECT id,"shortUrl",url,"visitCount" FROM urls WHERE "userId" = $1;`,
			[userId]
		);		
		const user = (
			await connection.query(
				`SELECT users.id,users.name, COALESCE(SUM(urls."visitCount"),0) AS "visitCount" 
                FROM users LEFT JOIN urls ON users.id = urls."userId" WHERE users.id = $1 GROUP BY users.id;`,
				[userId]
			)
		).rows[0];	
        user.visitCount = Number(user.visitCount);
		user["shortenedUrls"] = userUrls.rows;
		res.send(user);
	} catch {
		res.sendStatus(500);
	}
};
export { getUserData };
