import joi from "joi";
import { stripHtml } from "string-strip-html";

const urlSchema = joi.object({
	url: joi.string().uri().required()	
});

const urlValidationSchema = (req, res, next) => {
	const link = req.body;	
	if (link.url) {
		link.url = stripHtml(link.url).result.trim();
		
	}
	const urlValidation = urlSchema.validate(link, { abortEarly: false });
	if (urlValidation.error) {
		const errors = (urlValidation.error.details.map((error) => error.message)).join(" & ");
		return res.status(422).send(errors);
	}
	res.locals.url = link.url;
	next();
};
export {urlValidationSchema};