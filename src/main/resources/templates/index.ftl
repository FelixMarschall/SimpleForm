<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="color-scheme" content="light dark"/>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css"
    />
    <title>Hello world!</title>
    <script src="https://unpkg.com/htmx.org@1.9.10"></script>
</head>
<body>
<main class="container">
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
</body>
</html>