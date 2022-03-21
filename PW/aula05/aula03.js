function calculate() {
    let res;
    let op1 = parseInt(document.getElementById("op1").value);
    let op2 = parseInt(document.getElementById("op2").value);
    let oper = document.getElementById("oper").value;

    if(document.getElementById("op1").value.length === 0 || document.getElementById("op2").value.length == 0) {
        alert("⚠️ ERROR:Missing operands!!!");
    }

    if(oper == '+')
        res = op1 + op2;
    else if(oper == '-')
        res = op1 - op2;
    else if(oper == '*')
        res = op1 * op2;
    else if(oper == '/')
        res = op1 / op2;
    else
        res = undefined;
    document.getElementById("res").value = res;
}