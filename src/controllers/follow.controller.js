import { STATUS_CODE } from "../enums/statusCode.js";
import {
  isFollowing,
  insertFollow,
  deleteFollow,
} from "../repositories/follow.repository.js";

async function follow(req, res) {
  const { follower, followed } = req.body;

  try {
    const isAlreadyFollowing = (await isFollowing({ follower, followed }))
      .rows[0];

    if (isAlreadyFollowing) {
      await deleteFollow({ follower, followed });
      res.sendStatus(STATUS_CODE.NO_CONTENT);
    } else {
      await insertFollow({ follower, followed });
      res.sendStatus(STATUS_CODE.CREATED);
    }
  } catch (error) {
    res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

async function checkFollow(req, res) {
  const { follower, followed } = req.body;

  try {
    const isAlreadyFollowing = (await isFollowing({ follower, followed }))
      .rows[0];

    if (isAlreadyFollowing) {
      res.status(STATUS_CODE.OK).send(true);
    } else {
      res.status(STATUS_CODE.OK).send(false);
    }
  } catch (error) {
    res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

export { follow, checkFollow };
