# 🚀 Nexus One-Click Node Setup

This **one-click script** automates the installation of all required dependencies and sets up a **Nexus node** inside a `screen` session for easy management.

---

## 🎯 **Features**
✅ Installs **all required dependencies** (`curl`, `cargo`, `protoc`, `screen`).  
✅ **Automatically downloads & installs** the Nexus CLI.  
✅ Runs the installation in a **detached** `screen` session (`nexus`).  
✅ Allows easy reattachment to **monitor the process**.  

---

## 🔥 **Quick Installation**
Run the following command to instantly install & start the Nexus node:

```bash
wget -O install_nexus.sh https://raw.githubusercontent.com/HarbhagwanDhaliwal/nexus_one_click_node/main/install_nexus.sh && chmod +x install_nexus.sh && ./install_nexus.sh
```

---

## 📌 **Managing the Screen Session**  

🟢 **Check installation progress:**  
```bash
screen -r nexus
```

🟡 **Detach from the session (without stopping it):**  
Press **`CTRL + A`, then `D`**.

🔴 **Kill the session (if needed):**  
```bash
screen -S nexus -X quit
```

---

## 🛠️ **Alternative Installation (Manual Method)**  

### **Step 1️⃣: Clone the Repository**  
```bash
git clone https://github.com/HarbhagwanDhaliwal/nexus_one_click_node.git
cd nexus_one_click_node
```

### **Step 2️⃣: Grant Execution Permission**  
```bash
chmod +x install_nexus.sh
```

### **Step 3️⃣: Run the Script**  
```bash
./install_nexus.sh
```

---

## 🚑 **Troubleshooting**  

🔹 **Issue: "Command Not Found" Errors**  
If `cargo`, `protoc`, or any required tool is missing, manually install them:
```bash
sudo apt update && sudo apt install -y protobuf-compiler curl screen
```

🔹 **Issue: Setup failed? Re-run the script**  
```bash
./install_nexus.sh
```

---

## 📜 **License**  
This project is **open-source** and available under the **MIT License**.

---

🚀✨ **Your Nexus node is now up and running!** 🎉  
💡 **Use `screen -r nexus` to check the progress anytime.**
