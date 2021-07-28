package com.example.sproject.dao.address;

import java.util.ArrayList;
import java.util.List;

import com.example.sproject.model.address.Address_Group;
import com.example.sproject.model.address.Department;
import com.example.sproject.model.login.Member;

public interface AddressDao {

	int tot();

	List<Member> listMember(Member member);

	List<Address_Group> listAddressGroup(String m_id);

	List<Member> listPersonalGroup(Member member);

	int totPersonal(int adg_num);

	List<Member> searchList(Member member);

	int searchTotal(Member member);

	void simpleAdd(Member member);

	void groupAdd(Address_Group addressGroup);

	void groupDelete(Address_Group addressGroup);

	void groupNameUpdate(Address_Group addressGroup);

	List<Department> listDeptGroup();

	int totDept(String dpt_code);

	List<Member> listDeptGroup(Member member);

	List<Member> addressSearchListDept(Member member);

	List<Member> addressSearchListPersonal(Member member);

	void memberDelete(ArrayList<String> deleteArray, int adg_num);

	void addressGroup(List<String> groupList, int adg_num);

}
