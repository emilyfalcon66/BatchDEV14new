import { LightningElement } from 'lwc';

export default class P2cNonPrimitivesParent extends LightningElement {
    carouselInfo = [
        {
            src: "https://img.freepik.com/free-photo/purple-osteospermum-daisy-flower_1373-16.jpg?w=2000",
            header: "First Card",
            description: "First card description.",
            alternativeText: "First card accessible description.",
            href: "javascript:void(0);"
        },
        {
            src: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/1126px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg",
            header: "Second Card",
            description: "Second card description.",
            alternativeText: "Second card accessible description.",
            href: "javascript:void(0);"
        },
        {
            src: "https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?cs=srgb&dl=pexels-pixabay-56866.jpg&fm=jpg",
            header: "Third Card",
            description: "Third card description.",
            alternativeText: "Third card accessible description.",
            href: "javascript:void(0);"
        }
    ];
}