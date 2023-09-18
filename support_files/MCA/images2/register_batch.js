function prefermonth() {
if (!f2.month[0].checked && !f2.month[1].checked && !f2.month[2].checked && !f2.month[3].checked && !f2.month[4].checked && !f2.month[5].checked && !f2.month[6].checked) {
alert("Selected The Month As Per Your Preference!");
f2.month[0].select();
return false;
}
else {
f2.month[6].value=f2.month_specify.value;
return true;
}
}

function preferday() {
if (!f2.c1.checked && !f2.c2.checked && !f2.c3.checked && !f2.c4.checked) {
alert("Select The Day As Per Your Preference!");
f2.c1.select();
return false;
}
else {
f2.c4.value=f2.day_specify.value;
return true;
}
}

function prefertime() {
if (!f2.c5.checked && !f2.c6.checked && !f2.c7.checked && !f2.c8.checked && !f2.c9.checked) {
alert("Select The Time For Batches Other Than Saturday-Sunday!");
f2.c5.select();
return false;
}
else {
return true;
}
}

function prefertime1() {
if (!f2.c10.checked && !f2.c11.checked && !f2.c12.checked) {
alert("Select The Time For Batches On Saturday-Sunday!");
f2.c10.select();
return false;
}
else {
return true;
}
}

function prefercenter() {
if (!f2.center[0].checked && !f2.center[1].checked) {
alert("Select The center Applying For!");
f2.center[0].select();
return false;
}
else {
return true;
}
}

function preferplan() {
if (!f2.plan[0].checked && !f2.plan[1].checked && !f2.plan[2].checked && !f2.plan[3].checked) {
alert("Select The Plan Applying For!");
f2.plan[0].select();
return false;
}
else {
return true;
}
}


