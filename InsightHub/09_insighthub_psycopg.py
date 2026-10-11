# import psycopg
# from psycopg.rows import dict_row


# DB_CONFIG = {
#     "host": "localhost",
#     "port": 5432,
#     "dbname": "insighthub",
#     "user": "postgres",
#     "password": "123456",
# }


# try:
#     with psycopg.connect(**DB_CONFIG, row_factory=dict_row) as conn:
#             # with conn.cursor() as cur:
#             #     cur.execute(
#             #         """
#             #         SELECT id, email
#             #         FROM users
#             #         """
#             #     )
#             #     users = cur.fetchall()
#             #     for user in users:
#             #         print(user)


#             with conn.cursor() as cur:
#                 cur.execute(
#                     """
#                     INSERT INTO  users (email)
#                                 VALUES ('sahar@gmail.com')
#                     """
#                 )

# except psycopg.Error as error:
#     print("Could not connect to the database:", error)









import psycopg
from psycopg.rows import dict_row


DB_CONFIG = {
    "host": "localhost",
    "port": 5432,
    "dbname": "insighthub",
    "user": "postgres",
    "password": "123456",
}

# -------------------------------------------------------------------------
def create_user(conn):
    email = input("Email: ").strip()

    with conn.cursor() as cur:
        cur.execute(
            """
            INSERT INTO users (email)
            VALUES (%s)
            RETURNING id, email, created_at;
            """,
            (email,),
        )
        return cur.fetchone()

# -------------------------------------------------------------------------
def list_users(conn):
    with conn.cursor() as cur:
        cur.execute(
            """
            SELECT id, email, created_at
            FROM users
            ORDER BY id;
            """
        )
        return cur.fetchall()

# -------------------------------------------------------------------------
def update_user(conn):
    user_id = int(input("User ID: "))
    new_email = input("New email: ").strip()

    with conn.cursor() as cur:
        cur.execute(
            """
            UPDATE users
            SET email = %s
            WHERE id = %s
            RETURNING id, email, created_at;
            """,
            (new_email, user_id),
        )
        return cur.fetchone()

# -------------------------------------------------------------------------
def delete_user(conn):
    user_id = int(input("User ID: "))

    with conn.cursor() as cur:
        cur.execute(
            """
            DELETE FROM users
            WHERE id = %s
            RETURNING id, email;
            """,
            (user_id,),
        )
        return cur.fetchone()

# -------------------------------------------------------------------------
def show_menu():
    print("\n========== InsightHub ==========")
    print("1. Create user")
    print("2. List users")
    print("3. Update user")
    print("4. Delete user")
    print("5. Exit")
    print("================================")

# -------------------------------------------------------------------------
def main():
    try:
        with psycopg.connect(**DB_CONFIG, row_factory=dict_row, ) as conn:
            while True:
                show_menu()
                choice = input("Select an option: ").strip()

                try:
                    if choice == "1":
                        user = create_user(conn)
                        conn.commit()
                        print("User created successfully:")
                        print(user)


                    elif choice == "2":
                        users = list_users(conn)
                        if not users:
                            print("No users found.")
                            continue
                        print("\nUsers:")
                        print(f"| {"ID":<10}| {"Email":<20}| {"Created at":<40} |")
                        print(80*"-")
                        for user in users:
                            print(f"| {user['id']:<10}| {user['email']:<20}| {str(user['created_at']):<40} |")


                    elif choice == "3":
                        user = update_user(conn)
                        if user is None:
                            print("User not found.")
                        else:
                            conn.commit()
                            print("User updated successfully:")
                            print(user)


                    elif choice == "4":
                        user = delete_user(conn)
                        if user is None:
                            print("User not found.")
                        else:
                            conn.commit()
                            print("User deleted successfully:")
                            print(user)


                    elif choice == "5":
                        print("Goodbye!")
                        break


                    else:
                        print("Invalid option.")



                except ValueError:
                    conn.rollback()
                    print("User ID must be a number.")

                except psycopg.Error as error:
                    conn.rollback()
                    print("Database error:", error)

    except psycopg.Error as error:
        print("Could not connect to the database:", error)


# -------------------------------------------------------------------------
if __name__ == "__main__":
    main()