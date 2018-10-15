package com.guokai.cuds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guokai.cuds.bean.Employee;
import com.guokai.cuds.dao.EmployeeMapper;
@Service
public class EmpServie {
	@Autowired
	EmployeeMapper employeeMapper;
	public List<Employee> getAllEmps(){
		return employeeMapper.selectByExampleWithDept(null);
	}
	public int addEmp(Employee employee) {
		// TODO Auto-generated method stub
		return employeeMapper.insert(employee);
	}
	public Employee getEmpById(Integer id) {
		// TODO Auto-generated method stub
		return employeeMapper.selectByPrimaryKey(id);
	}
}
