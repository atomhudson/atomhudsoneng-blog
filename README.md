# [atomhudsoneng-blog](https://atomhudsoneng-blog.pages.dev/)

🚀 A personal blog built with [Hugo](https://gohugo.io/) and deployed with Cloudflare.  
This repository contains the source code, configuration, and deployment setup for my engineering blog.

---

## 📂 Project Structure

```

atomhudsoneng-blog/
│
├── archetypes/             # Content archetypes for new posts
├── content/                # Blog posts and page content (Markdown/HTML)
├── layouts/                # Custom Hugo layouts and templates
├── public/                 # Generated static site (after `hugo` build)
├── resources/              # Generated assets (CSS, etc.)
├── themes/terminal/        # Hugo theme in use
│
├── .gitmodules             # Submodule config (for theme management)
├── .hugo\_build.lock        # Build lock file
├── Dockerfile              # Container setup for building/deploying the blog
├── blog-deployment.yaml    # Deployment configuration (Kubernetes/Cloud)
├── cloudflared-linux-amd64.deb # Cloudflare tunnel package
├── hugo.toml               # Main site configuration
└── README.md               # You are here

````

---

## ⚡ Features

- 📝 **Markdown-based content** → Easy to write and manage posts.  
- 🎨 **Customizable Hugo theme (Terminal)** → Lightweight and responsive design.  
- 📦 **Dockerized setup** → Build and run the blog inside a container.  
- ☁️ **Cloudflare Integration** → Fast, secure, and globally distributed.  
- 🔧 **CI/CD Ready** → Configured for automated builds and deployment.  

---

## 🛠️ Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/atomhudson/atomhudsoneng-blog.git
cd atomhudsoneng-blog
````

### 2. Run with Hugo

Make sure you have [Hugo](https://gohugo.io/getting-started/installing/) installed.

```bash
hugo server -D
```

Visit your site locally at **[http://localhost:1313](http://localhost:1313)**

### 3. Run with Docker

```bash
docker build -t hugo-blog .
docker run -p 1313:1313 hugo-blog
```

---

## 📦 Deployment

* **Cloudflare Tunnel** → Used for secure hosting.

---

## 🧑‍💻 Contributing

Contributions are welcome!
If you’d like to suggest improvements, feel free to **open an issue** or **submit a PR**.

---

## 👤 Author

**Prashant Saini**

* ✉️ [dhruvsaini0904@gmail.com](mailto:dhruvsaini0904@gmail.com)
* 🌐 [GitHub Profile](https://github.com/atomhudson)
```
