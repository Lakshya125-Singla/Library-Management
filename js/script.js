document.addEventListener("DOMContentLoaded", () => {
    const buttons = document.querySelectorAll("button");
    buttons.forEach(btn => {
        btn.addEventListener("mouseenter", () => {
            btn.style.opacity = 0.9;
        });
        btn.addEventListener("mouseleave", () => {
            btn.style.opacity = 1;
        });
    });
});
