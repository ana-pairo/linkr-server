import joi from "joi";

const signUpSCHEMA = joi.object({
  email: joi.string().email().required(),
  password: joi
    .string()
    .required()
    .min(5)
    .regex(/\d/)
    .regex(/[A-Z]/)
    .regex(/[^A-Z a-z0-9]/),
  username: joi
    .string()
    .required()
    .trim()
    .regex(/^[a-zA-ZÀ-ü]+(?:\s[a-zA-ZÀ-ü]+)*$/),
  picture: joi
    .string()
    .required()
    .regex(
      /^(?:(?<scheme>[^:\/?#]+):)?(?:\/\/(?<authority>[^\/?#]*))?(?<path>[^?#]*\/)?(?<file>[^?#]*\.(?<extension>[Jj][Pp][Ee]?[Gg]|[Pp][Nn][Gg]|[Gg][Ii][Ff]))(?:\?(?<query>[^#]*))?(?:#(?<fragment>.*))?$/
    ),
});

const signInSCHEMA = joi.object({
  email: joi.string().email().required(),
  password: joi.string().required().trim(),
});

export { signUpSCHEMA, signInSCHEMA };
