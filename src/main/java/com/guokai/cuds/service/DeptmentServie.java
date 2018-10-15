package com.guokai.cuds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guokai.cuds.bean.Department;
import com.guokai.cuds.bean.Employee;
import com.guokai.cuds.dao.DepartmentMapper;
import com.guokai.cuds.dao.EmployeeMapper;
@Service
public class DeptmentServie {
	@Autowired
	DepartmentMapper departmentMapper;
	public List<Department> getDeptName(){
		return departmentMapper.selectByExample(null);
	}
}
