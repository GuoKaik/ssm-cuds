package com.guokai.cuds.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.guokai.cuds.bean.Employee;
import com.guokai.cuds.bean.Msg;
import com.guokai.cuds.service.EmpServie;

@Controller
public class EmpController {
	@Autowired
	EmpServie empservice;
	//@RequestMapping("/emps")
	public String getAllEmps(@RequestParam(value="pn",defaultValue="1") int pn,Model model) {
		PageHelper.startPage(pn, 5);
		List<Employee> employees = empservice.getAllEmps();
		PageInfo pageInfo = new PageInfo(employees,5);
		model.addAttribute("pageInfo", pageInfo);
		return "list";
	}
	
	
	@RequestMapping(value="/emps",method=RequestMethod.GET)
	@ResponseBody
	public Msg getAllEmpsWithJson(@RequestParam(value="pn",defaultValue="1") int pn) {
		PageHelper.startPage(pn, 5);
		List<Employee> employees = empservice.getAllEmps();
		PageInfo pageInfo = new PageInfo(employees,5);
		//model.addAttribute("pageInfo", pageInfo);
		return Msg.success().add("pageInfo", pageInfo);
	}
	@RequestMapping(value="/emps/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmpById(@PathVariable Integer id) {
		
		Employee employee = empservice.getEmpById(id);
		return Msg.success().add("employee", employee);
	}
	@RequestMapping(value="/emps",method=RequestMethod.POST)
	@ResponseBody
	public Msg empAdd(Employee employee) {
		empservice.addEmp(employee);
		return Msg.success();
	}
}
