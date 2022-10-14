import { connection } from "../database/db.js";
import { customAlphabet} from "nanoid";
const addShorten = async (req, res) => {
	const userId = res.locals.userId;
	const url = res.locals.url;
	const nanoid = customAlphabet(
		"1234567890abcdefghijklmnopqrstuvyxwzABCDEFGHIJKLMNOPQRSTUVWXYZ",
		8
	);
	try {
		const shortUrl = nanoid();
		await connection.query(
			`INSERT INTO urls (url,"shortUrl","userId") VALUES ($1,$2,$3);`,
			[url, shortUrl, userId]
		);
		res.sendStatus(200);
	} catch {
		res.sendStatus(500);
	}
};
const getUrl = async (req, res) => {
	const id = req.params.id;
	try {
		if (isNaN(id)) {
			return res.sendStatus(404);
		}
		const url = await connection.query(
			`SELECT id,"shortUrl",url FROM urls WHERE urls.id = $1;`,
			[id]
		);
		if (url.rows.length === 0) {
			return res.sendStatus(404);
		}
		res.send(url.rows[0]);
	} catch {
		res.sendStatus(500);
	}
};
const openUrl = async (req, res) => {
    const shortUrl = req.params.shortUrl;
    try {		
		const url = await connection.query(
			`SELECT id,url,"visitCount" FROM urls WHERE urls."shortUrl" = $1;`,
			[shortUrl]
		);
		if (url.rows.length === 0) {
			return res.sendStatus(404);
		}
        url.rows[0].visitCount ++
        await connection.query(`UPDATE urls SET "visitCount" = $1 WHERE urls.id = $2;`,[url.rows[0].visitCount,url.rows[0].id]);
		res.redirect(url.rows[0].url);
	} catch {
		res.sendStatus(500);
	}

};
const deleteUrl = async (req, res) => {
    const userId = res.locals.userId;
    const id = req.params.id;
    try {
		if (isNaN(id)) {
			return res.sendStatus(404);
		}
		const url = await connection.query(
			`SELECT id,"userId" FROM urls WHERE urls.id = $1;`,
			[id]
		);
		if (url.rows.length === 0) {
			return res.sendStatus(404);
		}
        if (url.rows[0].userId !== userId){
            return res.sendStatus(401);
        }
        await connection.query (`DELETE FROM urls WHERE urls.id = $1`,[id])
		res.sendStatus(204);
	} catch {
		res.sendStatus(500);
	}
};

export { addShorten, getUrl, openUrl, deleteUrl };
