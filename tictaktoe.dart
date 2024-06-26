let box=document.querySelectorAll(".box");
let reset=document.querySelector("#reset");
let container=document.querySelector(".msg-container");
let newbut=document.querySelector("#newbut");
let msg=document.querySelector("#msg");
let turnO=true;
const winpatterns=[
    [0,1,2],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [3,4,5],
    [0,4,8],
    [6,7,8],


];


const resetgame=()=>{
    turnO=true;
    enablebox();
    container.classList.add("hide");
};
const disablebox=()=>{
    for(let boxes of box){
        boxes.disabled=true;
    }
};
const enablebox=()=>{
    for(let boxes of box){
        boxes.disabled=false;
        boxes.innerText="";
    }
};


box.forEach((box) => {
    box.addEventListener("click" ,()=>{
        if(turnO){
            box.innerText="O";
            turnO=false;
        }
        else{
            
            box.innerText="X";
            turnO=true;

        }
        box.disabled=true;
        checkwinner();

    });
    
});
const showWinner=(winner)=>{
    msg.innerText="congratulations bro!! winner is "+winner;
    container.classList.remove("hide");
    disablebox();
}


const checkwinner=()=>{
    for(let pattern of winpatterns){
let pos1=box[pattern[0]].innerText;
let pos2=box[pattern[1]].innerText;
let pos3=box[pattern[2]].innerText;
if(pos1 !=""&& pos2!=""&& pos3!=""){
    if(pos1===pos2 && pos2===pos3){
        showWinner(pos1);
    }
}

    }
};

newbut.addEventListener("click",resetgame);
reset.addEventListener("click",resetgame);