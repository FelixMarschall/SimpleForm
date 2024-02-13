<html>
<#include "fragments/head.ftl">
<body>
<main class="container">
    <#include "fragments/menu.ftl">
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
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>
    </p>
</main>
</body>
</html>