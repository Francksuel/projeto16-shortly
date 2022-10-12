import joi from "joi";
import { stripHtml } from "string-strip-html";

const userSchema = joi.object({
	name: joi.string().min(3).required(),
	email: joi.string().email().required(),
	password: joi.string().min(4).required(),
	confirmPassword: joi.string().required().valid(joi.ref('password'))
});

const loginSchema = joi.object({
	email: joi.string().email().required(),
	password: joi.string().min(4).required(),
});

const userValidationSchema = (req, res, next) => {
	const registry = req.body;
	const firstValidation = userSchema.validate(registry, { abortEarly: false });
	if (!firstValidation.error) {
		registry.name = stripHtml(registry.name).result.trim();
		registry.email = stripHtml(registry.email).result.trim();
	}
	const userValidation = userSchema.validate(registry, { abortEarly: false });
	if (userValidation.error) {
		const errors = (userValidation.error.details.map((error) => error.message)).join(" & ");
		return res.status(422).send(errors);
	}
	res.locals.registry = registry;
	next();
};

const loginValidationSchema = (req, res, next) => {
	const login = req.body;
	if (login.email) {
		login.email = stripHtml(login.email).result.trim();
	}
	const loginValidation = loginSchema.validate(login, { abortEarly: false });
	if (loginValidation.error) {
		const errors = (loginValidation.error.details.map((error) => error.message)).join(" & ");;
		return res.status(422).send(errors);
	}
	res.locals.login = login;
	next();
};

export { userValidationSchema, loginValidationSchema };
