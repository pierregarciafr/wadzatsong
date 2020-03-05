const three = document.getElementById("3");
const two = document.getElementById("2");
const one = document.getElementById("1");
const buzzImgElt = document.getElementById("buzz-img");


const countDown = () => {
  buzzImgElt.style.visibility = "hidden";
    if (three) {
      setTimeout(() => {
        three.classList.remove('d-block');
        three.classList.add('d-none');
        two.classList.add('d-block');
        setTimeout(() => {
          two.classList.remove('d-block');
          two.classList.add('d-none');
          one.classList.add('d-block');
          setTimeout (() => {
            one.classList.remove('d-block');
            one.classList.add('d-none');
            buzzImgElt.style.visibility = "visible";
          }, 1000);
        }, 1000);
      }, 1000);
    }
}



export { countDown };
