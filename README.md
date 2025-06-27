<p align="center">
  <a href="https://laravel.com" target="_blank">
    <img src="https://laravel.com/img/logomark.min.svg" width="100" alt="Laravel Logo">
  </a>
</p>

<h1 align="center">SUB Programming Contest Management System (SUBPCMS)</h1>

<p align="center">
  <img src="INSERT_YOUR_LOGO_URL" width="150" alt="SUBPCMS Logo">
</p>

<p align="center">
  A robust, modular, and user-friendly platform built with Laravel and Vue.js to manage and organize programming contests at SUB.  
  Empowering educators and contest organizers with powerful tools to simplify contest creation, grading, and participant engagement.
</p>

---

## 🚀 Features

- **Contest Management** 🏆: Create, schedule, and manage programming contests effortlessly.
- **Problem Editor** ✏️: Add and edit problems with sample inputs/outputs and detailed explanations.
- **Online Judge** ⚖️: Automatic evaluation of submissions in real-time.
- **User Dashboard** 📊: Personalized dashboards for contestants, judges, and admins.
- **Ranking System** 🥇: Live leaderboard and detailed performance analytics.
- **Submission History** 📂: View, filter, and manage code submissions.
- **Discussion Forum** 💬: Facilitate participant discussion and problem clarification.
- **Admin Panel** 🔧: Powerful tools to manage users, contests, and system configurations.
- **Announcements** 📢: Publish updates and contest news.
- **Security** 🔒: User authentication, access control, and secure data handling.
- **Responsive Design** 📱: Accessible from desktops, tablets, and mobile devices.

---

## 🛠️ Built With

- **Laravel** – Elegant PHP framework for rapid backend development.
- **Vue.js** – Reactive JavaScript framework for a seamless and interactive frontend.
- **MySQL** – Reliable relational database for storing contest data.
- **Laravel Sanctum** – Secure authentication for API endpoints.
- **Laravel Mix** – Asset compilation and frontend build tool.

---

## 📦 Installation

Follow these steps to set up SUBPCMS locally:

```bash
# Clone the repository
git clone https://github.com/n3o-d4rk3r/subpcms.git
cd subpcms

# Install PHP dependencies
composer install

# Install JavaScript dependencies
npm install

# Copy and configure environment variables
cp .env.example .env
php artisan key:generate

# Set up the database (configure DB credentials in .env)
php artisan migrate

# Build frontend assets
npm run dev

# Start the development server
php artisan serve

Developer:
Md. Mahfuzur Rahman Siam
Computer Engineer
Gmail: ksiam3409@gmail.com
linkedin: https://www.linkedin.com/in/md-mahfuzur-rahman-siam/

📜 License
SUBPCMS is open-source software licensed under the MIT License.
