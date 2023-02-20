import jwt from "jsonwebtoken";
import dotenv from "dotenv";

dotenv.config();

import { STATUS_CODE } from "../enums/statusCode.js";
import { signUpSCHEMA, signInSCHEMA } from "../schemas/authSchema.js";
import {
  checkIfEmailIsValid,
  checkIfNameIsValid,
} from "../repositories/auth.repository.js";

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
    const isEmailRepited = (await checkIfEmailIsValid({ email })).rows[0];

    if (isEmailRepited) {
      res.status(STATUS_CODE.CONFLICT).send("This email is not available");

      return;
    }
  } catch (error) {
    res.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }

  try {
    const isNameRepited = (await checkIfNameIsValid({ username })).rows[0];

    if (isNameRepited) {
      res.status(STATUS_CODE.CONFLICT).send("This username is not available");

      return;
    }
  } catch (error) {
    res.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }

  next();
}

async function signInMiddleware(req, res, next) {
  if (!req.body) {
    res.sendStatus(STATUS_CODE.BAD_REQUEST);
    return;
  }

  const isBodyValid = signInSCHEMA.validate(req.body, { abortEarly: false });

  if (isBodyValid.error) {
    const errors = isBodyValid.error.details.map((detail) => detail.message);

    res.status(STATUS_CODE.UNPROCESSABLE).send(errors);
    return;
  }

  const { email } = req.body;

  try {
    const user = (await checkIfEmailIsValid({ email })).rows[0];

    if (!user) {
      res.sendStatus(STATUS_CODE.UNAUTHORIZED);
      return;
    }

    res.locals.user = user;

    next();
  } catch (error) {
    res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

function authMiddleware(req, res, next) {
  const token = req.headers.authorization?.replace("Bearer ", "");

  if (!token) {
    res.sendStatus(STATUS_CODE.UNAUTHORIZED);
    return;
  }

  try {
    const verifyToken = jwt.verify(token, process.env.TOKEN_SECRET);
    res.locals.userId = verifyToken.userId;
    next();
  } catch (error) {
    res.sendStatus(STATUS_CODE.UNAUTHORIZED);
  }
}

export { signUpMiddleware, signInMiddleware, authMiddleware };

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
