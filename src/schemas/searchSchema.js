import Joi from 'joi';

const searchSchema = Joi.object({
    search: Joi.string().required().min(3)
});

export { searchSchema };