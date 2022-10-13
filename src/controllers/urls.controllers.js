import { connection } from "../database/db.js";
import { customAlphabet, nanoid } from "nanoid";
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
const getUrl = (req, res) => {};
const openUrl = (req, res) => {};
const deleteUrl = (req, res) => {};

export { addShorten, getUrl, openUrl, deleteUrl };
