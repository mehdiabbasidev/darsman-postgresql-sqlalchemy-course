from fastapi import FastAPI

from app.database import SessionLocal
from app.services import documents as doc_service
from app.services import tags as tag_service
from app.services import users as user_service


app = FastAPI(title="InsightHub")

# -----------------------------------------------------------------------------
def show_menu() -> None:
    print("\n==== InsightHub ====")
    print("1) Insert a new user")
    print("2) List users")
    print("3) Search user by name")
    print("4) Edit a user")
    print("5) Delete a user")
    print("6) Add a tag")
    print("7) List documents")
    print("8) Exit")
    
# -----------------------------------------------------------------------------
def show_user_list(users) -> None:
    if not users:
        print("No users found.")
        return
    print("\nUsers:")
    header = f"| {'ID':<6}| {'Name':<20}| {'Email':<25}| {'Avatar':<25}| {'Bio':<50} |"
    print(header)
    print(len(header) * "-")
    for user in users:
        profile = user.profile
        full_name = (profile.full_name if profile else None) or "-"
        avatar = (profile.avatar_url if profile else None) or "-"
        bio = (profile.bio if profile else None) or "-"
        print(f"| {user.id:<6}| {full_name:<20}| {user.email:<25}| {avatar:<25}| {bio:<50} |")

# -----------------------------------------------------------------------------
def show_document_list(documents) -> None:
    if not documents:
        print("No documents found.")
        return

    header = f"| {'ID':<4}| {'Title':<40}| {'Created at':<30} |"
    print(header)
    print(len(header) * "-")
    for document in documents:
        print(f"| {document.id:<4}| {document.title:<40}| {str(document.created_at):<30} |")

# -----------------------------------------------------------------------------


def insert_user() -> None:
    email = input("Email: ").strip()
    full_name = input("Full name: ").strip()
    bio = input("Bio (optional): ").strip() or None

    with SessionLocal.begin() as session:
        user = user_service.create_user(session, email=email, full_name=full_name, bio=bio)
        print(f"User created: {user.id} - {user.email}")
        session.commit()












# -----------------------------------------------------------------------------
def list_users() -> None:
    with SessionLocal() as session:
        users = user_service.get_users(session, limit=50)
        if not users:
            print("No users found.")
            return

        show_user_list(users)

# -----------------------------------------------------------------------------
def search_user_by_name() -> None:
    name = input("Enter part of the name: ").strip()
    with SessionLocal() as session:
        users = user_service.search_users_by_name(session, name)
        if not users:
            print("No user found with this name.")
            return
        
        show_user_list(users)

# -----------------------------------------------------------------------------
def edit_user() -> None:
    user_id = int(input("User id to edit: "))
    full_name = input("New full name (leave empty to keep unchanged): ").strip() or None
    bio = input("New bio (leave empty to keep unchanged): ").strip() or None

    with SessionLocal.begin() as session:
        user = user_service.update_user(session, user_id, full_name=full_name, bio=bio)
        if user is None:
            print("No user found with this id.")
            return
        print(f"User updated: {user.id} - {user.profile.full_name}")

# -----------------------------------------------------------------------------
def delete_user() -> None:
    user_id = int(input("User id to delete: "))

    with SessionLocal.begin() as session:
        deleted = user_service.delete_user(session, user_id)
        print("User deleted." if deleted else "No user found with this id.")

# -----------------------------------------------------------------------------
def add_tag() -> None:
    name = input("New tag name: ").strip()
    with SessionLocal.begin() as session:
        tag = tag_service.get_or_create_tag(session, name)
        session.flush()
        print(f"Tag saved: {tag.id} - {tag.name}")


# -----------------------------------------------------------------------------
def list_documents() -> None:
    keyword=input("Enter keyword for search : ").strip()
    with SessionLocal() as session:
        documents = doc_service.search_documents(
                                session=session,
                                keyword=keyword, 
                                page=1, 
                                page_size=50)
        show_document_list(documents)

# -----------------------------------------------------------------------------
def main() -> None:
    while True:
        show_menu()
        choice = int(input("Your choice: "))

        match choice:
            case 1: 
                insert_user()
            case 2: 
                list_users()
            case 3: 
                search_user_by_name()
            case 4: 
                edit_user()
            case 5: 
                delete_user()
            case 6: 
                add_tag()
            case 7: 
                list_documents()
            case 8:
                print("Exiting the program.")
                break



if __name__ == "__main__":
    main()
