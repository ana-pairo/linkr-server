import { STATUS_CODE } from "../enums/statusCode.js";
import { getTotalPostCommentsByPostId } from "../repositories/comments.repository.js";

async function getComments(req, res) {
  const { postId } = res.locals;
  try {
    const comments = await getTotalPostCommentsByPostId(postId);

    return res.status(STATUS_CODE.OK).send(comments.rows);
  } catch (error) {
    return res.status(STATUS_CODE.SERVER_ERROR).send(error.message);
  }
}

export { getComments };
