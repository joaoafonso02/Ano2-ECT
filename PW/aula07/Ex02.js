var persons = '[ \
                {"fname": "Joao", "lname": "Azevedo", "email": "jaz@gmail.com"}, \
                {"fname": "Manel", "lname": "das Coives", "email": "man@gmail.com"}, \
                {"fname": "Gustavo", "lname": "Simp", "email": "simp@gmail.com"}, \
            ]';



function fill() {
    let data = JSON.parse(persons);
    let htm = "";
    for(i = 0; i < data.length; i++) {
        htm += "<tr>";
        htm += "<td>" + data[i].fname + "</td>";
        htm += "<td>" + data[i].lname + "</td>";
        htm += "<td>" + data[i].email + "</td>";
        htm += "</tr>";
    }
    document.getElementById("pessoal").innerHTML = htm;
}