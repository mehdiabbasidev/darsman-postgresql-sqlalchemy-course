from datetime import datetime

from sqlalchemy import DateTime, ForeignKey, func
from sqlalchemy.orm import Mapped, mapped_column

from app.database import Base



class DocumentTag(Base):
    __tablename__ = "document_tags"

    document_id: Mapped[int] = mapped_column(ForeignKey("documents.id", ondelete="CASCADE"), primary_key=True)
    tag_id: Mapped[int] = mapped_column(ForeignKey("tags.id", ondelete="CASCADE"), primary_key=True)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now())



















# from sqlalchemy import Column, DateTime, ForeignKey, Table, func
# from app.database import Base

# document_tags = Table(
#     "document_tags",
#     Base.metadata,
#     Column("document_id", ForeignKey("documents.id", ondelete="CASCADE"), primary_key=True),
#     Column("tag_id", ForeignKey("tags.id", ondelete="CASCADE"), primary_key=True),
#     Column("created_at", DateTime(timezone=True), server_default=func.now()),
# )
