<html>
<#include "fragments/head.ftl">
<body>
<main class="container">
    <#include "fragments/menu.ftl">
    <h1>Inventory</h1>
    <p>
    <table>
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Description</th>
            <th scope="col">Price</th>
        </tr>
        </thead>
        <tbody>
        <#list items as item>
            <tr>
                <th scope="row">${item.id}</th>
                <td>${item.name}</td>
                <td>${item.description}</td>
                <td>${item.price}</td>
            </tr>
        </#list>
        </tbody>
    </table>
    </p>
</main>
</body>
</html>