import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OutfoproductComponent } from './outfoproduct.component';

describe('OutfoproductComponent', () => {
  let component: OutfoproductComponent;
  let fixture: ComponentFixture<OutfoproductComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [OutfoproductComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(OutfoproductComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
