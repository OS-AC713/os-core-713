/* magoo@magoo32.com - 2024-06-01 */
/* I have tried to use RUS comments but please excuse bad translation */
/* Я постарался использовать комментарии на русском языке, но прошу прощения за некачественный перевод */

// Ждем полной загрузки DOM / Wait for DOM configuration
document.addEventListener("DOMContentLoaded", () => {
    const menuToggle = document.getElementById("menuToggle");
    const sidebar = document.getElementById("sidebar");
    const themeToggle = document.getElementById("themeToggle");

    // Обработка бокового меню / Sidebar switch behavior
    menuToggle.addEventListener("click", () => {
        sidebar.classList.toggle("open");
        menuToggle.innerText = sidebar.classList.contains("open") ? "✕ Закрыть" : "☰ Меню";
    });

    // Обработка темного режима / Light-dark context behavior
    themeToggle.addEventListener("click", () => {
        document.body.classList.toggle("dark");
    });
});

