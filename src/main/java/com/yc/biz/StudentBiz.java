package com.yc.biz;


import org.springframework.stereotype.Repository;

import com.yc.bean.Student;

/**
 * 学生功能接口类
 * @author Administrator
 *
 */
@Repository
public interface StudentBiz {
	/**
	 * 何翔
	 * 注册
	 * @return
	 */
	int reg(Student st);
	
	/**
	 * 胡超结
	 * 登录
	 * @param st
	 * @return
	 */
	Student selectStu(Student st);
}
