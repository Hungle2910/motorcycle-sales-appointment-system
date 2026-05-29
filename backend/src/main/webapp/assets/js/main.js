document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('form').forEach((form) => {
        form.addEventListener('submit', (event) => {
            const invalid = Array.from(form.elements).some((element) => element.required && !element.value);
            if (invalid) {
                event.preventDefault();
            }
        });
    });
});
