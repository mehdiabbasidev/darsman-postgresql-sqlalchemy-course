# دوره PostgreSQL و SQLAlchemy درسمن

این مخزن شامل کدهایی است که در دوره آموزش پروژه‌محور **Database Design، PostgreSQL، Python و SQLAlchemy** آکادمی درسمن تدریس شده‌اند. تمام مثال‌ها بر پایه پروژه آموزشی **InsightHub** نوشته شده‌اند؛ سامانه‌ای ساده برای مدیریت کاربران، پروفایل‌ها، اسناد و برچسب‌ها.

## محتوای مخزن

```text
darsman-postgresql-sqlalchemy-course/
├── InsightHub/
└── Insighthub_SQLAlchemy/
```

### `InsightHub`

این پوشه شامل بخش‌های پایه و میانی دوره است:

- ساخت دیتابیس و جداول PostgreSQL
- دستورات DDL، DML و DQL
- عملیات CRUD
- فیلتر، مرتب‌سازی و جست‌وجو
- ارتباط بین جداول با `INNER JOIN` و `LEFT JOIN`
- توابع تجمیعی، `GROUP BY` و `HAVING`
- تراکنش‌ها و دستورات TCL
- اتصال پایتون به PostgreSQL با `psycopg`
- نمونه ساده CRUD با SQLAlchemy

### `Insighthub_SQLAlchemy`

این پوشه نسخه چندفایلی پروژه با SQLAlchemy ORM است و شامل موارد زیر می‌شود:

- اتصال SQLAlchemy به PostgreSQL
- تعریف مدل‌های `User`، `UserProfile`، `Document`، `Tag` و `DocumentTag`
- پیاده‌سازی روابط یک‌به‌یک، یک‌به‌چند و چندبه‌چند
- کار با `Session` و تراکنش‌ها
- جداسازی مدل‌ها، تنظیمات دیتابیس و سرویس‌ها
- عملیات ثبت، نمایش، جست‌وجو، ویرایش و حذف اطلاعات

## پیش‌نیازها

- Python 3.10 یا جدیدتر
- PostgreSQL
- pgAdmin یا SQL Shell (`psql`)
- آشنایی مقدماتی با Python و SQL

## دریافت پروژه

```bash
git clone https://github.com/mehdiabbasidev/darsman-postgresql-sqlalchemy-course.git
cd darsman-postgresql-sqlalchemy-course
```

## ترتیب پیشنهادی اجرا

1. وارد پوشه `InsightHub` شوید.
2. فایل‌های SQL را مطابق شماره ابتدای نام آن‌ها اجرا کنید.
3. اطلاعات اتصال به PostgreSQL را در فایل‌های Python متناسب با سیستم خود تنظیم کنید.
4. مثال `psycopg` و سپس مثال ساده SQLAlchemy را اجرا کنید.
5. برای مشاهده ساختار کامل‌تر ORM، وارد پوشه `Insighthub_SQLAlchemy` شوید و پروژه چندفایلی را بررسی و اجرا کنید.

## نصب کتابخانه‌های Python

```bash
pip install psycopg sqlalchemy fastapi
```

## نکته مهم درباره تنظیمات اتصال

نام دیتابیس، نام کاربری و رمز عبور موجود در کدها صرفاً تنظیمات محیط آموزشی مدرس هستند. پیش از اجرا، این مقادیر را با تنظیمات PostgreSQL سیستم خود جایگزین کنید.

## هدف آموزشی

هدف این مخزن نمایش یک مسیر پیوسته از **طراحی دیتابیس و نوشتن SQL خام** تا **اتصال PostgreSQL به Python و پیاده‌سازی ORM با SQLAlchemy** است. پیشنهاد می‌شود فایل‌ها را به ترتیب تدریس دوره مطالعه و اجرا کنید.

## مدرس

**مهندس مهدی عباسی**  
[آکادمی درسمن](https://darsman.com)

