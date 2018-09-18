package com.yc.biz.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.Student;
import com.yc.biz.StudentBiz;
import com.yc.dao.BaseDao;

/**
 * 学生功能实现类
 * @author Administrator
 *
 */
@Service
@Transactional
public class StudentBizImpl implements StudentBiz{
	@Resource(name = "baseDaoImpl")
	private BaseDao<Student> baseDao;
	
	/**
	 * 注册
	 */
	@Override
	public int reg(Student st) {
		System.out.println("用户名:"+st.getName()+"  时间"+new Date());
		int i = this.baseDao.add(st, "reg");
		return i;
	}

	/**
	 * 登录
	 */
	@Override
	@Transactional(readOnly=true)
	public Student selectStu(Student st) {
		System.out.println("用户名:"+st.getName()+"  时间"+new Date());
		List<Student> list=this.baseDao.findAll(st, "selectStu");
		if(list!=null&&list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
		
	}

}
