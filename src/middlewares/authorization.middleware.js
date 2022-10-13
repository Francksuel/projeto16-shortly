import { connection } from "../database/db.js";

const checkUser = async (req, res, next) => {
	try {
		const { authorization } = req.headers;
		const token = authorization?.replace("Bearer ", "");
		if (!token) return res.sendStatus(401);

		const session = (await connection.query(`SELECT * FROM sessions WHERE token = $1`,[token])).rows[0];
		if (!session) return res.sendStatus(401);
		res.locals.userId = session.userId;
		next();
	} catch {
		return res.sendStatus(500);
	}
};
export { checkUser };