import joi from "joi";
import { stripHtml } from "string-strip-html";

const urlSchema = joi.object({
	url: joi
		.string()
		.pattern(
			/https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[-a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.?&//=]*)/
		)
		.required(),
});

const urlValidationSchema = (req, res, next) => {
	const link = req.body;
	if (link.url) {
		link.url = stripHtml(link.url).result.trim();
	}
	const urlValidation = urlSchema.validate(link, { abortEarly: false });
	if (urlValidation.error) {
		const errors = urlValidation.error.details
			.map((error) => error.message)
			.join(" & ");
		return res.status(422).send(errors);
	}
	res.locals.url = link.url;
	next();
};
export { urlValidationSchema };
