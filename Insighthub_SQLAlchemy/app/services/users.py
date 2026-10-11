from collections.abc import Sequence

from sqlalchemy import select
from sqlalchemy.orm import Session, contains_eager

from app.models import  User, UserProfile

# -------------------------------------------------------------------------
def create_user(session: Session, email: str, full_name: str, bio: str | None = None) -> User:
    user = User(email=email)
    user.profile = UserProfile(full_name=full_name, bio=bio)

    session.add(user)   
    session.flush() 
    return user


# -------------------------------------------------------------------------
def get_users(session: Session, limit: int = 5) -> Sequence[User]:
    stmt = select(User).order_by(User.id).limit(limit)
    return session.scalars(stmt).all()


# -------------------------------------------------------------------------
def search_users_by_name(session: Session, name: str) -> Sequence[User]:
    pattern = f"%{name}%"
    stmt = (
        select(User)
        .join(User.profile)
        .where(UserProfile.full_name.ilike(pattern))
        .options(contains_eager(User.profile))
        .order_by(User.id)
    )

    return session.scalars(stmt).all()


# -------------------------------------------------------------------------
def update_user(
    session: Session,
    user_id: int,
    full_name: str | None = None,
    bio: str | None = None,
) -> User | None:
    
    user = session.get(User, user_id)
    if user is None:
        return None

    if full_name is not None:
        user.profile.full_name = full_name
    if bio is not None:
        user.profile.bio = bio
    return user


# -------------------------------------------------------------------------
def delete_user(session: Session, user_id: int) -> bool:
    user = session.get(User, user_id)
    if user is None:
        return False
    session.delete(user)
    return True


