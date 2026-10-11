from datetime import datetime

from sqlalchemy import (
    BigInteger, DateTime, Identity, MetaData, String,
    create_engine, func, select,
)

from sqlalchemy.orm import (
    DeclarativeBase, Mapped, Session, mapped_column,
)

from sqlalchemy.exc import SQLAlchemyError


# Database connection
engine = create_engine("postgresql+psycopg://postgres:123456@localhost:5432/insighthub")


# Base model
class Base(DeclarativeBase):
    pass

   
# users table model
class User(Base):
    __tablename__ = "users"

    id: Mapped[int] = mapped_column(
        BigInteger,
        Identity(),
        primary_key=True,
    )

    email: Mapped[str] = mapped_column(
        String(255),
        unique=True,
        nullable=False,
    )

    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        server_default=func.now(),
        nullable=False,
    )

    def __str__(self):
        return f"| {self.id:<10}| {self.email:<20}| {str(self.created_at):<40} |"

# -------------------------------------------------------------------------
def create_user(session):
    email = input("Email: ").strip()

    user = User(email=email)
    session.add(user)
    session.flush()
    return user

# -------------------------------------------------------------------------
def list_users(session):
    statement = select(User).order_by(User.id)
    return session.scalars(statement).all()

# -------------------------------------------------------------------------
def update_user(session):
    user_id = int(input("User ID: "))
    new_email = input("New email: ").strip()

    user = session.get(User, user_id)
    if user is None:
        return None

    user.email = new_email
    session.flush()
    return user

# -------------------------------------------------------------------------
def delete_user(session):
    user_id = int(input("User ID: "))

    user = session.get(User, user_id)
    if user is None:
        return None

    session.delete(user)
    session.flush()
    return user

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
        with Session(engine) as session:
            while True:
                show_menu()
                choice = input("Select an option: ").strip()

                try:
                    if choice == "1":
                        user = create_user(session)
                        session.commit()
                        print("User created successfully:")
                        print(user)


                    elif choice == "2":
                        users = list_users(session)
                        if not users:
                            print("No users found.")
                            continue

                        print("\nUsers:")
                        print(f"| {"ID":<10}| {"Email":<20}| {"Created at":<40} |")
                        print(80*"-")
                        for user in users:
                            print(user)


                    elif choice == "3":
                        user = update_user(session)
                        if user is None:
                            print("User not found.")
                        else:
                            session.commit()
                            print("User updated successfully:")
                            print(user)


                    elif choice == "4":
                        user = delete_user(session)
                        if user is None:
                            print("User not found.")
                        else:
                            session.commit()
                            print("User deleted successfully:")
                            print(user)


                    elif choice == "5":
                        print("Goodbye!")
                        break


                    else:
                        print("Invalid option.")



                except ValueError:
                    session.rollback()
                    print("User ID must be a number.")

                except SQLAlchemyError as error:
                    session.rollback()
                    print("Database error:", error)

    except SQLAlchemyError as error:
        print("Could not connect to the database:", error)


# -------------------------------------------------------------------------
if __name__ == "__main__":
    main()
