import { getUsersBySearch } from "../repositories/users.repository.js";
import { searchSchema } from "../schemas/searchSchema.js";

async function searchUser (req, res) {
    const { search } = req.params;

    const validation = searchSchema.validate(req.params);

    if(validation.error) {
        const errors = validation.error.details.map(detail => detail.message);
        return res.status(422).send(errors);
    }

    try {
        const users = (await getUsersBySearch(search)).rows;

        return res.status(200).send(users);
    } catch (error) {
        return res.status(500).send(error.message);
    }
}

export { searchUser };