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
    <h1>Login</h1>
    <p>
        <#if error??>
            <div id="error" class="alert" style="display: none;">${error}</div>
        </#if>
        <form action="login" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Login</button>
        </form>
    </p>
</main>
</body>
</html>