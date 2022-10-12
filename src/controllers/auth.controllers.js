import { connection } from "../database/db.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

async function repeatEmail(email) {
	const users = (await connection.query("SELECT * FROM users;")).rows;
	return users.filter((element) => element.email === email);
}
const signUp = async (req, res) => {
	try {
		const registry = res.locals.registry;
		const isRepeatEmail = await repeatEmail(registry.email).then((repeat) => {
			return repeat.length;
		});
		if (isRepeatEmail !== 0) {
			return res.sendStatus(409);
		}
		const passwordHash = bcrypt.hashSync(registry.password, 10);
		await connection.query(
			"INSERT INTO users (name,email,password) VALUES ($1,$2,$3);",
			[registry.name, registry.email, passwordHash]
		);
		res.sendStatus(201);
	} catch {
		res.sendStatus(500);
	}
};

const signIn = async (req, res) => {
	const login = res.locals.login;
	try {        
		const user = (await connection.query("SELECT * FROM users WHERE email = $1;",[login.email])).rows[0]
		
        if (!user) return res.status(401).send("Usuário e/ou senha inválidos");

		const passwordChecked = await bcrypt.compare(login.password, user.password);        
		if (passwordChecked) {            
			const token = uuid();
			await connection.query(`INSERT INTO sessions ("userId",token) VALUES ($1,$2);`, [user.id,token]);			
			res.status(200).send({ token:token });
		} else {
			res.status(401).send("Usuário e/ou senha inválidos");
		}
	} catch {
		res.sendStatus(500);
	}
};
export { signUp, signIn };
