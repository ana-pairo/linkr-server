import Joi from 'joi';

const postUpdateSchema = Joi.object({
    newDescription: Joi.string().allow(''),
    newTrends: Joi.array().items(Joi.string()).required()
});

const postSchema = Joi.object({
    description: Joi.string().allow(''),
    trends: Joi.array().items(Joi.string()).required(),
    link: Joi.string().required()
});

export { postSchema, postUpdateSchema };