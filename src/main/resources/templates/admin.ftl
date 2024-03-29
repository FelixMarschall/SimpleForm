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
                <input type="number" id="price" name="price" min="0.0" step="0.1" aria-invalid="" required/>
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
                <button id="button-send" style="width: 30%" type="submit" form="new-item" data-target="modal-example">
                    Create
                </button>
            </footer>
        </article>
    </dialog>
    <!-- ./ Modal example -->
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
                <th scope="row">${item.id?c}</th>
                <td>${item.name}</td>
                <td>${item.description}</td>
                <td>${item.price}</td>
                <td>
                    <a class="clickable-icon" data-target="modal-update"
                       onclick="toggleModalWithData(event, ${item.id?c})">
                        <i data-feather="edit"></i>
                    </a>
                </td>
                <td>
                    <a class="clickable-icon" onclick="deleteItem(event, ${item.id?c})">
                        <i data-feather="trash-2"></i>
                    </a>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>

    <!-- update modal -->
    <dialog id="modal-update">
        <article>
            <header>
                <a
                        href="#close"
                        aria-label="Close"
                        rel="prev"
                        data-target="modal-update"
                        onclick="toggleModal(event)"
                ></a>
                <h3>Update Item</h3>
            </header>
            <p>
            <form id="update-item" action="/admin" method="post">
                <input type="hidden" id="id" name="id"/>
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required/>
                <label for="description">Description</label>
                <input type="text" id="description" name="description" required/>
                <label for="price">Price</label>
                <input type="number" id="price" name="price" min="0.0" step="0.1" required/>
            </form>
            </p>
            <footer>
                <a
                        href="#cancel"
                        role="button"
                        class="secondary"
                        data-target="modal-update"
                        onclick="toggleModal(event)"
                >Cancel</a>
                <button id="button-send" style="width: 30%" type="submit" form="update-item" data-target="modal-update">
                    Update
                </button>
            </footer>
        </article>
    </dialog>
    <!-- ./ update modal -->

    <script src="/js/button_send.js"></script>
    <script src="/js/modal.js"></script>
    <script src="/js/delete.js"></script>
    </p>
</main>
<#include "fragments/end_script.ftl">
<#include "fragments/footer.ftl">
</body>
</html>