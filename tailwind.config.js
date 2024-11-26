/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/main/webapp/**/*.jsp", // Match all JSP files in your webapp directory
    "./src/main/webapp/**/*.html", // If you have plain HTML files
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
