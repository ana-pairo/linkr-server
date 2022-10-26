import joi from "joi";

const followSCHEMA = joi.object({
  follower: joi.number().required(),
  followed: joi.number().required(),
});

export { followSCHEMA };
