import random, string

user_ids = list(range(1, 101))
recipient_ids = list(range(1, 101))

def generate_message() -> dict:
    random_user_id = random.choice(user_ids)

    #Copy recipients list
    tmp_recipient_ids = recipient_ids.copy()

    # Remove the user id from recipient id list
    tmp_recipient_ids.remove(random_user_id)
    random_recipeint_id = random.choice(tmp_recipient_ids)

    # Generate a random message
    message = "".join(random.choice(string.ascii_letters) for i in range(32))

    return {
        'user_id': random_user_id,
        'recipeint_id': random_recipeint_id,
        'message': message
    }
