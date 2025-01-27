import { Routes } from '@angular/router';
import { AddproductComponent } from './addproduct/addproduct.component';
import { ListproductComponent } from './listproduct/listproduct.component';
import { OutfoproductComponent } from './outfoproduct/outfoproduct.component';
import { HistoryProductComponent } from './history-product/history-product.component';
import { ProductChartComponent } from './product-chart/product-chart.component';
import { loginComponent} from './login/login.component';

export const routes: Routes = [
    { path: '', redirectTo: '/login', pathMatch: 'full' },
    {
        path: 'login',
        component: loginComponent
    },
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
    {
        path: 'history',
        component: HistoryProductComponent
    },
    {
        path: 'prroductchart',
        component:ProductChartComponent
    },
];
