import { LightningElement } from 'lwc';

export default class QuerySelector extends LightningElement {
    fruits = ["Passionfruit", "Pineapple","Pomegranate", "Plum", "Pear"];

    clickHandler() {
        //querySelector demo
        const h1elem = this.template.querySelector('h1');
        console.log(h1elem.innerText);
        h1elem.style.color= "#663791";
        h1elem.style.border= "2px solid #1bc5e3";
        h1elem.style.background= "#d61ec1";

        const pElmnt = this.template.querySelector('p');
        console.log(pElmnt.innerText);
        pElmnt.style.color= "##1a0804"
        pElmnt.style.border= "2px solid #1bc5e3";
        pElmnt.style.background= "#5bb5b2";

        //querySelectors demo
        const divelems = this.template.querySelectorAll('div.child');
        divelems.forEach(item => {
            console.log(item.innerText);
            item.setAttribute("class", "slds-align_absolute-center");
            item.style.color = '#41f51d';
        })
    }
}