KVM (Kernel-based Virtual Machine) là giải pháp ảo hóa trên Linux.

Là loại ảo hóa full virtualization

Có nhiều công cụ để quản lý như: 
 * Virt-manager
 * Câu lệnh Virsh
 * Webvirtmgr
 * Kimchi

Thành phần của 1 VM
 * File xml: chứa thông tin đầy đủ để tạo ra 1 VM có một file chứa đầy đủ thông tin và gồm nhiều các file nhỏ khác
 * File img: là file disk của VM. Có 2 định dạng là raw và qcow2.

Mô hình mạng
 * Linux-bridge
 * NAT
 * Host-only

Cơ chế snapshot
 * Internal: Các bản snapshot tạo ra nằm trong file disk
 * External: Tạo một file riêng biệt

Chuyển VM giữa các host
 * Tắt và chuyển
 * Live migrate