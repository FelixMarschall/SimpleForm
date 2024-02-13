<html>
<#include "fragments/head.ftl">
<body>
<main class="container">
    <#include "fragments/menu.ftl">

    <h1>${message}</h1>
    <p>
        This is a simple example of a web page using Pico CSS.
    </p>
    <p>
        We want to make an example for a simple web page providing a form.
    </p>
    <form hx-post="/submit" hx-trigger="submit" hx-target="#message" hx-swap="innerHTML">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <input type="submit" id="submit-button" value="Submit">
        <div id="message"></div>
    </form>
</main>
<#include "fragments/end_script.ftl">
</body>
</html>