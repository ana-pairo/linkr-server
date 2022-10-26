import { STATUS_CODE } from "../enums/statusCode.js";
import { getTotalPostCommentsByPostId } from "../repositories/comments.repository.js";

async function getTotalPostComments(req, res) {
  const { postId } = res.locals;

  try {
    const totalComments = (await getTotalPostCommentsByPostId(postId)).rows[0]
      .totalComments;

    return res.status(STATUS_CODE.OK).send(totalComments);
  } catch (error) {
    return res.status(STATUS_CODE.SERVER_ERROR).send(error.message);
  }
}

export { getTotalPostComments };
