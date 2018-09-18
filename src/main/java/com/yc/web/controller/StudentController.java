package com.yc.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yc.bean.Student;
import com.yc.biz.StudentBiz;

@Controller
@SessionAttributes("student")
public class StudentController {

	@Resource(name = "studentBizImpl")
	private StudentBiz studentBiz;

	/**
	 * 登录
	 * 胡超结
	 * @param stu
	 *            用户
	 * @return
	 *//*
	@RequestMapping(value = "loginstu.action", method = RequestMethod.POST)
	public String reg(Student stu, HttpSession session, HttpServletRequest req) {
		String valcode = req.getParameter("code");
		String rand = (String)session.getAttribute("vcode");
		System.out.println(stu);
		if (valcode.equals(rand)) {
			stu = studentBiz.selectStu(stu);
			System.out.println(stu);
			if (stu != null && !"".equals(stu)) {
				session.setAttribute("stu", stu);
				return "show";
			}else{
				return "erro";
			}
		} else {
			return "index";
		}
	}
	*/
	/**
	 * 登录
	 * 胡超结
	 * @param stu
	 *            用户
	 * @return
	 */
	@RequestMapping(value = "loginstu.action", method = RequestMethod.POST)
	public String selectStu(Student stu, HttpSession session, HttpServletRequest req) {
			stu = studentBiz.selectStu(stu);
			if (stu != null && !"".equals(stu)) {
				session.setAttribute("stu", stu);
				return "show";
			}else{
				return "erro";
			}
	}

	/**
	 * 注册 何翔
	 * 
	 * @param name
	 * @param pwd
	 * @return
	 */
	@RequestMapping(value = "reg.action", method = RequestMethod.POST)
	public @ResponseBody String reg(String name, String pwd) {
		Student student = new Student();
		student.setName(name);
		student.setPwd(pwd);
		int result = studentBiz.reg(student);
		return String.valueOf(result);
	}
}
