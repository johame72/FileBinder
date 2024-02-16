# 📁 FileBinder

**🌟 FileBinder** is a cutting-edge tool designed to streamline the process of consolidating various code files 📄 from your projects into a single, organized TEXT document 📚. Whether you're a developer 👩‍💻👨‍💻 looking to compile your project's source code for review 🕵️, documentation 📖, or archival purposes 🗃️, FileBinder simplifies the workflow by automating the concatenation of files while preserving their structure and hierarchy.

## 🚀 Features
- **Selective File Integration**: Easily specify file types 📑 to include in your PDF, from `.js`, `.jsx`, `.html`, `.css`, to `.txt`, ensuring that only relevant files make it to the final document.
- **Directory Exclusion**: Effortlessly exclude directories like `node_modules` 🚫 or any other non-essential folders to keep your document clean and focused on your code.
- **Relative Path Inclusion**: Maintain context with each file's relative path and name 🛣️ included in the PDF, making navigation and reference a breeze.
- **Automated Concatenation and Conversion**: FileBinder automates the tedious process of manually combining files 🔄 and converting them into a PDF format 📄➡️📁, saving you time and effort.
- **Customizable Output**: Tailor the output file's location 🗺️ and name 🏷️ to fit your project's needs, offering flexibility in how and where you store your compiled documents.

## 🌱 Getting Started
To start with FileBinder, follow these steps:

1. **Clone this repository** to your local machine 💻:

   ```bash
   git clone https://github.com/your-username/FileBinder.git
   ```

2. **Navigate to the FileBinder directory**:

   ```bash
   cd FileBinder
   ```

3. **Add the script to your PATH**:

   - For PowerShell scripts (`.ps1`):
     - Create a `.cmd` file (e.g., `FileBinder.cmd`) with the following content:

       ```cmd
       @echo off
       powershell -ExecutionPolicy Bypass -File "%~dp0FileBinder.ps1" %*
       ```

     - Add the directory containing `FileBinder.cmd` to your PATH environment variable:

       ```powershell
       $env:PATH += ";C:\path\to\FileBinder"
       ```

   - For Command Prompt scripts (`.cmd` or `.bat`):
     - Simply add the directory containing the script to your PATH environment variable:

       ```powershell
       $env:PATH += ";C:\path\to\FileBinder"
       ```

4. **Run FileBinder** from any terminal by typing:

   ```bash
   FileBinder
   ```

## 💡 Contributions
FileBinder is an open-source project 💖, and contributions are warmly welcomed. Whether you're looking to fix bugs 🐛, improve features ✨, or suggest new functionalities 🆕, check out our contributing guidelines for more information on how to get involved.

## 📜 License
FileBinder is released under the MIT License 📄. See the LICENSE file for more details.
```

This README provides instructions for adding the FileBinder script to the user's PATH environment variable, allowing it to be run from the terminal by typing `FileBinder`. The instructions are provided for both PowerShell and Command Prompt scripts.
