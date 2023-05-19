import { LightningElement } from 'lwc';

export default class TemplateLooping2 extends LightningElement {
    contacts = [
        {
        Name : "Jeff Bezos", 
        Title : "Executive Chairman", 
        Company : "Amazon", 
        Stay : "United States"},

        {
        Name : "Sundar Pichai", 
        Title : "Chief Executive Officer", 
        Company : "Google", 
        Stay : "United States"
        },
        {
        Name : "Tim Cook", 
        Title : "Chief Executive Officer", 
        company : "Apple", 
        Stay : "United States"
        },
        {
        Name : "Mark Zuckerberg", 
        Title : "Chief Executive Officer", 
        Company : "Facebook", 
        Stay : "United States"}
    ];
}