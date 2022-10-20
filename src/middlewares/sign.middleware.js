import { STATUS_CODE } from "../enums/statusCode.js";
import { signUpSCHEMA } from "../schemas/signUpSchema.js";
import { checkIfEmailIsRepited } from "../repositories/sign.repository.js";

async function signUpMiddleware(req, res, next) {
  if (!req.body) {
    res.sendStatus(STATUS_CODE.BAD_REQUEST);
  }

  const isBodyValid = signUpSCHEMA.validate(req.body, { abortEarly: false });

  if (isBodyValid.error) {
    const errors = checkErrors({ isBodyValid });

    if (errors.length !== 0) {
      res.status(STATUS_CODE.UNPROCESSABLE).send(errors);
      return;
    } else {
      const genericErrors = isBodyValid.error.details.map(
        (detail) => detail.message
      );
      res.status(STATUS_CODE.UNPROCESSABLE).send(genericErrors);
      return;
    }
  }

  const { email, username } = req.body;

  try {
    const isEmailRepited = (await checkIfEmailIsRepited({ email })).rows[0];

    if (isEmailRepited) {
      res.status(STATUS_CODE.CONFLICT).send("This email is not available");

      return;
    }
  } catch (error) {
    res.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }

  const arrayName = username.split(" ");

  if (arrayName.length > 0) {
    for (let i = 0; i < arrayName.length; i++) {
      arrayName[i] =
        arrayName[i].charAt(0).toUpperCase() + arrayName[i].slice(1);
    }

    const treatedName = arrayName.join(" ");

    res.locals.username = treatedName;
  } else {
    res.locals.username = username;
  }

  next();
}

export { signUpMiddleware };

function checkErrors({ isBodyValid }) {
  const errors = [];

  isBodyValid.error.details.map((detail) => {
    if (detail.message === '"email" must be a valid email') {
      errors.push("Invalid email");
    }
    if (
      detail.message.includes("/^[a-zA-ZÀ-ü]+(?:\\s[a-zA-ZÀ-ü]+)*$/") ||
      detail.message === '"username" is not allowed to be empty'
    ) {
      errors.push("Invalid username");
    }
    if (
      (detail.message.includes("/[^A-Z a-z0-9]/") ||
        detail.message.includes("/[A-Z]/") ||
        detail.message.includes("/\\d/") ||
        detail.message ===
          '"password" length must be at least 4 characters long') &&
      !errors.includes("Invalid password")
    ) {
      errors.push("Invalid password");
    }
    if (detail.message.includes("[Gg]|[Pp][Nn][Gg]|[Gg][Ii][Ff]")) {
      errors.push("Invalid URL picture");
    }

    return detail.message;
  });

  return errors;
}