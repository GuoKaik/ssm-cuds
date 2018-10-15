package com.guokai.cuds.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.guokai.cuds.bean.Employee;
import com.guokai.cuds.bean.Msg;
import com.guokai.cuds.service.DeptmentServie;
import com.guokai.cuds.service.EmpServie;

@Controller
public class DeptmentController {
	@Autowired
	DeptmentServie deptmentServie;
	
	@RequestMapping(value="/getDeptName")
	@ResponseBody
	public Msg getDeptName() {
		List depts = deptmentServie.getDeptName();
		return Msg.success().add("depts", depts);
	}
}
