<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <title>Dynamic Pagination</title>
  <link rel="stylesheet" type="text/css" href="./css/adminuser.css">
  <style>
    /* Your CSS styles here */
  </style>
</head>
<jsp:include page="../AdminNav.jsp"></jsp:include>
<body>
  <main>
    <!-- Your main content here -->
     <main>
        <section class="header">
            <div class="items-controller">
                <h5>Show</h5>
                <select name="" id="itemperpage">
                    <option value="10">10</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                    <option value="all">Show All</option>
                </select>
                <h5>Per Page</h5>
            </div>
            <div class="search">
                <h5>Search</h5>
                <input type="text" name="" id="search" placeholder="search">
            </div>
        </section>
        <section class="field">
            <table>
                <thead>
                    <tr>
                      <th><input type="checkbox" name="" id="selectAll"></th>
                      <th>Order.NO</th>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Pickup</th>
                      <th>Drop Location</th>
                      <th>Weight</th>
                      <th>Con of parcel</th>
                      <th>Address</th>
                      <th>Email</th>
                      <th>Ph No</th>
                      <th>Add Info</th>
                      <th>Price</th>
                      <th>Transaction status</th>
                      <th>Date_Col</th>
                      <th>Order Track</th>
                      <th>Edit</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="del" items="${deliverList}">
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>${del.orderid}</td>
                      	<td>${del.fname}</td>
                      	<td>${del.lname}</td>
                      	<td>${del.pickup}</td>
                      	<td>${del.droploc}</td>
                      	<td>${del.weight}</td>
                      	<td>${del.conparcel}</td>
                      	<td>${del.address}</td>
                      	<td>${del.email}</td>
                      	<td>${del.phnum}</td>
                      	<td>${del.addinfo}</td>
                      	<td>${del.price}</td>
                      	<td>${del.transtatus}</td>
                      	<td>${del.date_col}</td>
                      	<td>${del.ordertrack}</td>
                      	
                        <td><a href="deliverydelete?id=${del.orderid}" class="fa fa-trash"></a></td>
                    </tr>
                      </c:forEach>
                  </tbody>
            </table>
            <div class="bottom-field">
                <ul class="pagination">
                  <li class="prev"><a href="#" id="prev">&#139;</a></li>
                    <!-- page number here -->
                  <li class="next"><a href="#" id="next">&#155;</a></li>
                </ul>
            </div>
        </section>
    </main>
  </main>
 <script>
    // Your JavaScript code here
    var tbody = document.querySelector("tbody");
    var pageUl = document.querySelector(".pagination");
    var itemShow = document.querySelector("#itemperpage");
    var tr = tbody.querySelectorAll("tr");
    var emptyBox = [];
    var index = 1;
    var itemPerPage = 10;
    var totalItems = tr.length;

    for (let i = 0; i < tr.length; i++) {
      emptyBox.push(tr[i]);
    }

    itemShow.onchange = giveTrPerPage;
    function giveTrPerPage() {
      var selectedValue = this.value;
      if (selectedValue === "all") {
        itemPerPage = totalItems;
      } else {
        itemPerPage = parseInt(selectedValue, 10);
      }
      displayPage(itemPerPage);
      pageGenerator(itemPerPage);
      getpagElement(itemPerPage);
    }

    function displayPage(limit) {
      tbody.innerHTML = '';
      for (let i = 0; i < limit; i++) {
        tbody.appendChild(emptyBox[i]);
      }
      const pageNum = pageUl.querySelectorAll('.list');
      pageNum.forEach(n => n.remove());
    }
    displayPage(itemPerPage);

    function pageGenerator(getem) {
      const num_of_tr = emptyBox.length;
      if (num_of_tr <= getem) {
        pageUl.style.display = 'none';
      } else {
        pageUl.style.display = 'flex';
        const num_Of_Page = Math.ceil(num_of_tr / getem);
        for (i = 1; i <= num_Of_Page; i++) {
          const li = document.createElement('li');
          li.className = 'list';
          const a = document.createElement('a');
          a.href = '#';
          a.innerText = i;
          a.setAttribute('data-page', i);
          li.appendChild(a);
          pageUl.insertBefore(li, pageUl.querySelector('.next'));
        }
      }
    }
    pageGenerator(itemPerPage);
    let pageLink = pageUl.querySelectorAll("a");
    let lastPage = pageLink.length - 2;

    function pageRunner(page, items, lastPage, active) {
      for (button of page) {
        button.onclick = e => {
          const page_num = e.target.getAttribute('data-page');
          const page_mover = e.target.getAttribute('id');
          if (page_num != null) {
            index = page_num;

          } else {
            if (page_mover === "next") {
              index++;
              if (index >= lastPage) {
                index = lastPage;
              }
            } else {
              index--;
              if (index <= 1) {
                index = 1;
              }
            }
          }
          pageMaker(index, items, active);
        }
      }
    }
    var pageLi = pageUl.querySelectorAll('.list');
    pageLi[0].classList.add("active");
    pageRunner(pageLink, itemPerPage, lastPage, pageLi);

    function getpagElement(val) {
      let pagelink = pageUl.querySelectorAll("a");
      let lastpage = pagelink.length - 2;
      let pageli = pageUl.querySelectorAll('.list');
      pageli[0].classList.add("active");
      pageRunner(pagelink, val, lastpage, pageli);
    }

    function pageMaker(index, item_per_page, activePage) {
      const start = item_per_page * index;
      const end = start + item_per_page;
      const current_page = emptyBox.slice((start - item_per_page), (end - item_per_page));
      tbody.innerHTML = "";
      for (let j = 0; j < current_page.length; j++) {
        let item = current_page[j];
        tbody.appendChild(item);
      }
      Array.from(activePage).forEach((e) => { e.classList.remove("active"); });
      activePage[index - 1].classList.add("active");
    }

    // search content 
    var search = document.getElementById("search");
    search.onkeyup = e => {
      const text = e.target.value.trim().toLowerCase();
      for (let i = 0; i < tr.length; i++) {
        let found = false;
        for (let j = 1; j < tr[i].children.length; j++) {
          const matchText = tr[i].children[j].innerText.trim().toLowerCase();
          if (matchText.indexOf(text) > -1) {
            found = true;
            break;
          }
        }
        tr[i].style.display = found ? "table-row" : "none";
      }
    }
  </script>
</body>
</html>
