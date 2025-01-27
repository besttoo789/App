import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-user-selection',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class loginComponent {
  // ข้อมูลจำลองสำหรับผู้ใช้
  users = [
    { id: 1, name: 'Admin 1', role: 'admin' },
    { id: 2, name: 'Admin 2', role: 'admin' },
    { id: 3, name: 'พนักงาน 1', role: 'employee' },
    { id: 4, name: 'พนักงาน 2', role: 'employee' },
    { id: 5, name: 'ช่าง 1', role: 'technician' },
    { id: 6, name: 'ช่าง 2', role: 'technician' },
  ];

  // ตัวเลือกที่เลือก
  selectedAdmin: string | null = null;
  selectedEmployee: string | null = null;
  selectedTechnician: string | null = null;

  // ดึงข้อมูลผู้ใช้ตามบทบาท
  getUsersByRole(role: string) {
    return this.users.filter((user) => user.role === role);
  }

  // บันทึกตัวเลือกของผู้ใช้
  onSelectionChange(type: string, value: string) {
    if (type === 'admin') {
      this.selectedAdmin = value;
    } else if (type === 'employee') {
      this.selectedEmployee = value;
    } else if (type === 'technician') {
      this.selectedTechnician = value;
    }
  }
}
