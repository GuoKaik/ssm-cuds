package com.guokai.cuds.test;

import static org.hamcrest.CoreMatchers.endsWith;

import java.awt.List;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.validator.PublicClassValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.guokai.cuds.bean.Department;
import com.guokai.cuds.bean.Employee;
import com.guokai.cuds.dao.DepartmentMapper;
import com.guokai.cuds.dao.EmployeeMapper;
@RunWith(value=SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:ApplicationContext.xml"})
public class ssmDaoTest {
	
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	SqlSession sqlSessionTemplate;
	@Test
	public void deptDaoTest() throws Exception {
//		Department department = new Department();
//		department.setDeptName("ÑÐ·¢²¿");
//		departmentMapper.insert(department);
		EmployeeMapper employeeMapper = sqlSessionTemplate.getMapper(EmployeeMapper.class);
		int i=0;
		String name = "";
		while(i<1000) {
			String gender="M";
			int dId=2;
			Random random = new Random();
			if(random.nextInt(100)>60) {
				gender="F";
				dId=1;
			}
			employeeMapper.insert(new Employee(null, generateName(), gender, null, dId));
			i++;
		}
	}
	public String generateName() throws Exception {
		String name = getFirstName();
		name+=getRadomChar();
		Random random = new Random();
		if(random.nextInt(100)>60) {
			name+=getRadomChar();
		}
		return name;
	}
	public String getRadomChar() {
		String str = "";
		Random random = new Random();
		int hightCode = 176+Math.abs(random.nextInt(39));
		int lowerCode = 161+Math.abs(random.nextInt(93));
		byte[] b = new byte[2];
		b[0]=Integer.valueOf(hightCode).byteValue();
		b[1]=Integer.valueOf(lowerCode).byteValue();
		
		str = new String(b);
		return str;
	}
	public String getFirstName() throws Exception {
		ArrayList<String> arrayList = getFirstNameLsit();
		Random random = new Random();
		return arrayList.get(random.nextInt(arrayList.size()));
	}
	public ArrayList<String> getFirstNameLsit() throws Exception {
		InputStream inputStream = new FileInputStream("C:\\Users\\guokaikai\\Desktop\\baijaixing.txt");
		ByteArrayOutputStream out = new ByteArrayOutputStream(); 
		
		byte[] buf = new byte[2];
		ArrayList<String> ls = new ArrayList<String>();
		int n=0;
		while((n=inputStream.read(buf))!=-1) {
			out.write(buf, 0, n);
			String str = new String(buf);
			ls.add(str);
		}
		out.close();
		inputStream.close();
//		byte[] data = out.toByteArray();
//		String str = new String(data);
		return ls;
	}
}
