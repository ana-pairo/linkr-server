import Joi from 'joi';

const postUpdateSchema = Joi.object({
    newDescription: Joi.string().required(),
    newTrends: Joi.array().items(Joi.string()).required()
});

const postSchema = Joi.object({
    description: Joi.string().required(),
    trends: Joi.array().items(Joi.string()).required(),
    link: Joi.string().required()
});

export { postSchema, postUpdateSchema };