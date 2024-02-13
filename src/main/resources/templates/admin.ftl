<!DOCTYPE html>
<html lang="en">
<#include "fragments/head.ftl">
<body>
<main class="container">
    <#include "fragments/menu.ftl">
    <h1>Admin Panel</h1>
    <article>You're about to tinker with the database. Remember, with great power comes great... potential for messing
        things up.
    </article>
    <p>
    <section id="modal">
        <button class="secondary" data-target="modal-example" onclick="toggleModal(event)">
            New Item <i data-feather="file-plus"></i>
        </button>
    </section>
    <!-- Modal example -->
    <dialog id="modal-example">
        <article>
            <header>
                <a
                        href="#close"
                        aria-label="Close"
                        rel="prev"
                        data-target="modal-example"
                        onclick="toggleModal(event)"
                ></a>
                <h3>New Item</h3>
            </header>
            <p>
            <form id="new-item" action="/admin" method="post">

                <label for="name">Name</label>
                <input type="text" id="name" name="name" required/>
                <label for="description">Description</label>
                <input type="text" id="description" name="description" required/>
                <label for="price">Price</label>
                <input type="number" id="price" name="price" min="0" aria-invalid="" required/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            </p>
            <footer>
                <a
                        href="#cancel"
                        role="button"
                        class="secondary"
                        data-target="modal-example"
                        onclick="toggleModal(event)"
                >Cancel</a
                >
                <button id="button-send" style="width: 30%" type="submit" form="new-item" data-target="modal-example">Create</button>
            </footer>
        </article>
    </dialog>
    <!-- ./ Modal example -->
    <script src="/js/modal.js"></script>
    <script src="/js/button_send.js"></script>
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
                <td><i data-feather="edit"></i></td>
                <td><i data-feather="trash-2"></i></td>
            </tr>
        </#list>
        </tbody>
    </table>
    </p>
</main>
<#include "fragments/end_script.ftl">
</body>
</html>