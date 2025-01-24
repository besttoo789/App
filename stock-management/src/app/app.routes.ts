import { Routes } from '@angular/router';
import { AddproductComponent } from './addproduct/addproduct.component';
import { ListproductComponent } from './listproduct/listproduct.component';
import { OutfoproductComponent } from './outfoproduct/outfoproduct.component';

export const routes: Routes = [
    {
        path:'addproduct',
        component: AddproductComponent
    },
    {
        path:'listproduct',
        component: ListproductComponent
    },
    {
        path: 'outfoproduct',
        component: OutfoproductComponent
    },
];
