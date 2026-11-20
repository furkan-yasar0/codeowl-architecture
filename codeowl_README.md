# 🦉 CodeOwl — Architecture & Database Design

> **Note:** This repository contains only the database schema and architectural documentation.  
> Source code is closed-source. This repo exists to showcase the system design and technical decisions.

---

## 📌 What is CodeOwl?

CodeOwl is a full-featured **developer community platform** built with PHP 8.x and MySQL. It allows developers to share code snippets, open-source projects, and communicate with each other through a forum and direct messaging system.

---

## 🛠 Tech Stack

| Layer | Technology |
|---|---|
| Backend | PHP 8.x (Native) |
| Database | MySQL / MariaDB |
| Auth | Google OAuth 2.0 (`google/apiclient`) |
| Encryption | OpenSSL — AES-128-CBC |
| Security | Prepared Statements (mysqli), MD5 file naming |

---

## 🌟 Core Features

- **Forum System** — Topic creation, code file uploads, like/dislike, comments
- **DevHub** — ZIP-based open-source project sharing with category filtering
- **Direct Messaging (DM)** — Real-time-like private chat with read/unread tracking
- **Follow System** — User follow/unfollow with follower counts
- **Role-Based Access Control (RBAC)** — Admin / Premium / Member roles
- **Admin Panel** — User moderation, ban/unban management
- **Google OAuth 2.0** — Single sign-on with automatic account creation
- **AES-128-CBC Encryption** — Password encryption via OpenSSL
- **Premium Content** — Video tutorials restricted to Premium/Admin roles

---

## 🗄 Database Architecture

The system uses **11 relational tables** managed with InnoDB engine:

| Table | Purpose |
|---|---|
| `users` | User accounts with role, ban status, and Google auth flag |
| `categories` | Programming language categories with MIME type and extension |
| `forum` | Forum topics with uploaded code files |
| `commentsforum` | Comments on forum topics |
| `likes` | Forum topic likes (prevents duplicate likes) |
| `likescomments` | Comment likes |
| `devhub` | Open-source project entries with ZIP files |
| `likedevhub` | DevHub project likes |
| `messages` | Direct messages with read/unread (`seen`) status |
| `lastmessages` | DM inbox summary (latest message per conversation) |
| `follow` | User follow relationships |

See [`schema.sql`](./schema.sql) for the full table structure.

---

## 🔑 Key Technical Decisions

### 1. DM Room Key Generation
Conversation room codes are generated deterministically:
```
sort([user1, user2]) → join → base64_encode
```
This ensures two users always map to the same room regardless of who initiates the conversation.

### 2. Duplicate Like Prevention
Separate junction tables (`likes`, `likescomments`, `likedevhub`) track which user liked which content — preventing duplicate likes without complex locking.

### 3. Cascade Username Update
When a user changes their username, it propagates across all related tables (forum topics, comments, likes, devhub entries) in a single transaction.

### 4. File Security
Uploaded files are renamed using `md5(time() . $originalName)` to prevent path traversal and naming conflicts. MIME type validation is enforced per category.

---

## 📂 Repository Contents

```
codeowl-architecture/
├── schema.sql       # Full database schema (no data)
└── README.md        # This file
```

---

*Built by [Furkan Yaşar](https://linkedin.com/in/furkan-yasar)*
