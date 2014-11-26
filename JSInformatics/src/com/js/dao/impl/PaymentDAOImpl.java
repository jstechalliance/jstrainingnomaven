package com.js.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbcp.BasicDataSource;

import com.js.dao.EmployeeDAO;
import com.js.dao.PaymentDAO;
import com.js.dao.StudentSMSDAO;
import com.js.dto.AcademicProjectDTO;
import com.js.dto.Employee;
import com.js.dto.NewAcademicProjectEnquiryDTO;
import com.js.dto.Payment;
import com.js.dto.PaymentRemark;
import com.js.dto.PaymentSearch;
import com.js.dto.StudentSMSDTO;
import com.js.dto.TrainingRegistrationDTO;
import com.js.enums.EnquiryType;
import com.js.properties.MessagePropertyReader;
import com.js.service.EmployeeService;


@SuppressWarnings("deprecation")
public class PaymentDAOImpl implements PaymentDAO{
	
	private BasicDataSource basicDataSource;
	private StudentSMSDAO studentSMSDAO;
	private EmployeeDAO employeeDAO;
	
	public BasicDataSource getBasicDataSource() {
		return basicDataSource;
	}

	public void setBasicDataSource(BasicDataSource basicDataSource) {
		this.basicDataSource = basicDataSource;
	}
	
	public StudentSMSDAO getStudentSMSDAO() {
		return studentSMSDAO;
	}

	public void setStudentSMSDAO(StudentSMSDAO studentSMSDAO) {
		this.studentSMSDAO = studentSMSDAO;
	}

	public EmployeeDAO getEmployeeDAO() {
		return employeeDAO;
	}

	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}

	public Map<EnquiryType, List> searchResultForMakePayment(
			PaymentSearch search, String branchid, String employeeid)
			throws Exception {
		Map<EnquiryType, List> map = new HashMap<EnquiryType, List>();
		List<TrainingRegistrationDTO> candidateList = new ArrayList<TrainingRegistrationDTO>();
		List<AcademicProjectDTO> list = new ArrayList<AcademicProjectDTO>();
		map.put(EnquiryType.Training, candidateList);
		map.put(EnquiryType.Academic_Project, list);
		Connection con = null;

		if (search.getDialog_source().contains("Training")
				|| search.getDialog_source().contains("Select")) {
			String selection = "en.enquiry_id,en.full_name,en.father_name,en.qualification,en.college,en.semester,en.preferred_time_start,en.joining_date,en.reference_id,en.employee_id,en.enquiry_status,en.preferred_time_end,en.enquiry_date,en.address,en.date_of_birth,en.enrollment_no,en.photo_path,en.purpose,en.entry_time";
			String query = "SELECT "
					+ selection
					+ " FROM tbl_enquiry en,tbl_registration re where en.enquiry_id=re.enquiry_id and re.registration_id like '"
					+ branchid + "%'";

			if (!search.getDialog_code().equalsIgnoreCase("")) {
				query = query + " and re.registration_id like '%"
						+ search.getDialog_code() + "%'";
			}
			// select * from (SELECT registration_id
			// reg_id,(total_amount-discount_amount-(SELECT
			// COALESCE(SUM(amount),0) FROM jsinformatics.tbl_payment where
			// myid=reg1.registration_id)) AS due_amount FROM
			// jsinformatics.tbl_registration reg1)tbl1 where due_amount
			// between 1000 and 4000
			if (!search.getDialog_name().equalsIgnoreCase("")) {
				query = query + " and full_name like '%"
						+ search.getDialog_name() + "%'";
			}
			// System.out.println(search.getDueAmountFrom()+" : "+search.getDueAmountTo());
			if (!search.getDueAmountFrom().equalsIgnoreCase("")
					|| !search.getDueAmountTo().equalsIgnoreCase("")) {
				String where = "";
				if (!search.getDialog_code().equalsIgnoreCase("")) {
					where = "where registration_id like '%"
							+ search.getDialog_code() + "%'";
				}
				if (search.getDueAmountFrom().equalsIgnoreCase("")) {
					query = query
							+ " and re.registration_id in(select reg_id from (SELECT registration_id reg_id,(total_amount-discount_amount-(SELECT COALESCE(SUM(amount),0) FROM jsinformatics.tbl_payment where myid=reg1.registration_id)) AS due_amount FROM jsinformatics.tbl_registration reg1 "
							+ where + ")tbl1 where due_amount<= '"
							+ search.getDueAmountTo() + "') ";
				} else if (search.getDueAmountTo().equalsIgnoreCase("")) {
					query = query
							+ " and re.registration_id in(select reg_id from (SELECT registration_id reg_id,(total_amount-discount_amount-(SELECT COALESCE(SUM(amount),0) FROM jsinformatics.tbl_payment where myid=reg1.registration_id)) AS due_amount FROM jsinformatics.tbl_registration reg1 "
							+ where + ")tbl1 where due_amount>= '"
							+ search.getDueAmountFrom() + "') ";
				} else {
					query = query
							+ " and re.registration_id in(select reg_id from (SELECT registration_id reg_id,(total_amount-discount_amount-(SELECT COALESCE(SUM(amount),0) FROM jsinformatics.tbl_payment where myid=reg1.registration_id)) AS due_amount FROM jsinformatics.tbl_registration reg1 "
							+ where + ")tbl1 where due_amount between '"
							+ search.getDueAmountFrom() + "' and '"
							+ search.getDueAmountTo() + "') ";
				}
			}
			// System.out.println("getApprovel : "+search.getApprovel());
			if (!search.getApprovel().equalsIgnoreCase("Select")
					&& !search.getApprovel().equalsIgnoreCase("")) {
				String myapp = "SELECT distinct(myid) FROM jsinformatics.tbl_payment where myid like '"
						+ branchid
						+ "%' and payment_status='"
						+ search.getApprovel() + "' and myid like '%tra%'";
				if (search.getApprovel().equalsIgnoreCase("Approved")) {
					myapp = myapp + " and approvel_date between '"
							+ search.getApprovalDateStart() + "' and '"
							+ search.getApprovalDateEnd() + "'";
				} else if (search.getApprovel()
						.equalsIgnoreCase("Not Approved")) {
					myapp = myapp + " and payment_date between '"
							+ search.getApprovalDateStart() + "' and '"
							+ search.getApprovalDateEnd() + "'";
				}
				// //System.out.println(search.getApprovalDate());
				query = query + " and re.registration_id in(" + myapp + ")";
			}
			if (!search.getPaymentDateFrom().equalsIgnoreCase("")
					&& !search.getPaymentDateTo().equalsIgnoreCase("")) {
				String myapp = "SELECT distinct(myid) FROM jsinformatics.tbl_payment where myid like '"
						+ branchid
						+ "%' and myid like '%TRA%'  and payment_date between '"
						+ search.getPaymentDateFrom()
						+ "' and '"
						+ search.getPaymentDateTo() + "'";

				query = query + " and re.registration_id in(" + myapp + ")";
			}
			if (!search.getRecievedBy().equalsIgnoreCase("Select")
					&& !search.getRecievedBy().equalsIgnoreCase("")) {
				String myapp = "SELECT distinct(myid) FROM jsinformatics.tbl_payment where myid like '"
						+ branchid
						+ "%' and myid like '%TRA%'  and received_by = '"
						+ search.getRecievedBy() + "'";

				query = query + " and re.registration_id in(" + myapp + ")";
			}
			if (!search.getApprovedBy().equalsIgnoreCase("Select")
					&& !search.getApprovedBy().equalsIgnoreCase("")) {
				String myapp = "SELECT distinct(myid) FROM jsinformatics.tbl_payment where myid like '"
						+ branchid
						+ "%' and myid like '%TRA%'  and approved_by = '"
						+ search.getApprovedBy() + "'";

				query = query + " and re.registration_id in(" + myapp + ")";
			}
			if (!search.getPayingDateStart().equalsIgnoreCase("")
					&& !search.getPayingDateEnd().equalsIgnoreCase("")) {
				String myapp = "SELECT myid FROM (SELECT * FROM tbl_payment_remark where myid like '"
						+ branchid
						+ "%' and myid like '%TRA%' and payment_alert between '"
						+ search.getPayingDateStart()
						+ "' and '"
						+ search.getPayingDateEnd()
						+ "' order by payment_alert DESC) as mytbl GROUP BY mytbl.myid";
				query = query + " and re.registration_id in(" + myapp + ")";
			}

			try {
				con = basicDataSource.getConnection();
				Statement st = con.createStatement();
				System.out.println("Query : " + query);
				ResultSet rs = st.executeQuery(query);
				while (rs.next()) {
					TrainingRegistrationDTO trainingRegistrationDTO = new TrainingRegistrationDTO();
					trainingRegistrationDTO.setEnquiry_id(rs
							.getString("enquiry_id"));
					trainingRegistrationDTO.setFullname(rs
							.getString("full_name"));
					trainingRegistrationDTO.setFather_name(rs
							.getString("father_name"));
					trainingRegistrationDTO.setQualification(rs
							.getString("qualification"));
					trainingRegistrationDTO.setSemester(rs
							.getString("semester"));
					trainingRegistrationDTO.setPreferredtime_start(rs
							.getString("preferred_time_start"));
					trainingRegistrationDTO.setJoining_date(rs
							.getString("joining_date"));
					trainingRegistrationDTO.setReferenceId(rs
							.getString("reference_id"));
					trainingRegistrationDTO.setEmployee_id(rs
							.getString("employee_id"));
					trainingRegistrationDTO.setEnquiry_status(rs
							.getString("enquiry_status"));
					trainingRegistrationDTO.setPreferredtime_end(rs
							.getString("preferred_time_end"));
					trainingRegistrationDTO.setEnquiry_date(rs
							.getString("enquiry_date"));

					String col = rs.getString("college");
					Statement tst11 = con.createStatement();
					ResultSet trs11 = tst11
							.executeQuery("select * from tbl_college where college_code='"
									+ col + "'");
					String col_name = "";
					if (trs11.next()) {
						col_name = trs11.getString("college_name");
						trainingRegistrationDTO.setCollege(col_name);
					} else {
						trainingRegistrationDTO.setCollege(col);
					}
					trs11.close();
					tst11.close();

					Statement tst1 = con.createStatement();
					ResultSet trs1 = tst1
							.executeQuery("select * from tbl_contact where my_id='"
									+ trainingRegistrationDTO.getEnquiry_id()
									+ "'");
					String c_no = "";
					while (trs1.next()) {
						c_no = c_no + trs1.getString("contact_no") + ", ";
					}
					trs1.close();
					tst1.close();
					trainingRegistrationDTO.setContact_no(c_no);

					Statement tst12 = con.createStatement();
					ResultSet trs12 = tst12
							.executeQuery("select * from tbl_email where my_id='"
									+ trainingRegistrationDTO.getEnquiry_id()
									+ "'");
					String email = "";
					while (trs12.next()) {
						email = email + trs12.getString("email_id") + ", ";
					}
					trs12.close();
					tst12.close();
					trainingRegistrationDTO.setEmail_id(email);

					Statement tst2 = con.createStatement(
							ResultSet.TYPE_SCROLL_SENSITIVE,
							ResultSet.CONCUR_UPDATABLE);
					ResultSet trs2 = tst2
							.executeQuery("select course_name from tbl_cource where course_id in (select course_id from tbl_intrested_course where enquiry_id='"
									+ trainingRegistrationDTO.getEnquiry_id()
									+ "')");
					trs2.last();
					String c_courses[] = new String[trs2.getRow()];
					trs2.beforeFirst();
					int count = 0;
					while (trs2.next()) {
						c_courses[count] = trs2.getString("course_name");
						count++;
					}
					count = 0;
					trs2.close();
					tst2.close();
					trainingRegistrationDTO.setCourse(c_courses);

					Statement tst3 = con.createStatement();
					ResultSet trs3 = tst3
							.executeQuery("select * from tbl_reference where reference_id='"
									+ trainingRegistrationDTO.getReferenceId()
									+ "'");
					String referenceName = "";
					if (trs3.next()) {
						referenceName = trs3.getString("full_name");
						String reference_contact_no = trs3
								.getString("contact_no");
						trainingRegistrationDTO
								.setReference_name(referenceName);
						trainingRegistrationDTO
								.setReference_contact_no(reference_contact_no);

					}
					trs3.close();
					tst3.close();

					tst3 = con.createStatement();
					trs3 = tst3
							.executeQuery("select * from relation_with_reference where myid='"
									+ trainingRegistrationDTO.getEnquiry_id()
									+ "'");
					if (trs3.next()) {
						String reference_note = trs3.getString("note");
						trainingRegistrationDTO
								.setReference_note(reference_note);
					}
					trs3.close();
					tst3.close();

					Statement tst4 = con.createStatement();
					String q = "select * from tbl_employee where employee_id='"
							+ trainingRegistrationDTO.getEnquiry_id() + "'";
					// System.out.println("Query For Reference : " + q);
					ResultSet trs4 = tst4.executeQuery(q);
					String employeeName = "";
					if (trs4.next()) {
						employeeName = trs4.getString("full_name");
					}
					trs4.close();
					tst4.close();
					trainingRegistrationDTO.setEmployee_id(employeeName);

					Statement tst5 = con.createStatement();
					ResultSet trs5 = tst5
							.executeQuery("select * from tbl_registration where enquiry_id ='"
									+ trainingRegistrationDTO.getEnquiry_id()
									+ "'");
					if (trs5.next()) {
						trainingRegistrationDTO.setRegistration_id(trs5
								.getString("registration_id"));
						trainingRegistrationDTO.setReg_date(trs5
								.getString("reg_date"));
						// trainingRegistrationDTO.setAddress(trs5.getString("address"));
						// trainingRegistrationDTO.setDate_of_birth(trs5.getString("date_of_birth"));
						// trainingRegistrationDTO.setEnrollment_no(trs5.getString("enrollment_no"));
						trainingRegistrationDTO.setBatch_time_start(trs5
								.getString("batch_time_start"));
						trainingRegistrationDTO.setBatch_time_end(trs5
								.getString("batch_time_end"));
						// trainingRegistrationDTO.setPhoto_path(trs5.getString("photo_path"));
						trainingRegistrationDTO.setReg_employee_id(trs5
								.getString("employee_id"));
						int totalAmt = trs5.getInt("total_amount");
						int discountAmt = trs5.getInt("discount_amount");

						int payableAmt = (totalAmt - discountAmt);
						trainingRegistrationDTO.setTotal_amount(totalAmt);
						trainingRegistrationDTO.setDiscount_amount(discountAmt);
						trainingRegistrationDTO.setPayable_amount(payableAmt);
						trainingRegistrationDTO.setDiscount_detail(trs5
								.getString("discount_detail"));
						String course[] = new String[] { trs5
								.getString("register_for_course") };
						Statement st5 = con.createStatement();
						ResultSet rs5 = st5
								.executeQuery("select * from tbl_cource where course_id='"
										+ course[0] + "'");
						if (rs5.next()) {
							trainingRegistrationDTO.setCoursename(rs5
									.getString("course_name"));
						}
						rs5.close();
						st5.close();
						trainingRegistrationDTO.setCourse(course);
					}
					trs5.close();
					tst5.close();

					Statement tsta = con.createStatement();
					q = "SELECT COALESCE((SELECT max(payment_alert) FROM tbl_payment_remark where myid='"
							+ trainingRegistrationDTO.getRegistration_id()
							+ "' group by myid),(SELECT reg_date FROM tbl_registration where registration_id='"
							+ trainingRegistrationDTO.getRegistration_id()
							+ "')) as alertdate";
					ResultSet trsa = tsta.executeQuery(q);
					if (trsa.next()) {
						String date = trsa.getString("alertdate");
						trainingRegistrationDTO.setAlertDate(date);
					}
					trsa.close();
					tsta.close();

					candidateList.add(trainingRegistrationDTO);
				}
				rs.close();
				st.close();
			} finally {
				con.close();
			}
		}
		if (search.getDialog_source().contains("Academic Project")
				|| search.getDialog_source().contains("Select")) {

			String query = "SELECT * FROM tbl_academic_project ac,tbl_enquiry en where ac.reg_date!='1970-01-01' and ac.enquiry_id=en.enquiry_id and project_id like '"
					+ branchid + "%' ";
			if (!search.getDialog_code().equalsIgnoreCase("")) {
				query = query + " and project_id like '%"
						+ search.getDialog_code() + "%'";
			}
			if (!search.getDialog_name().equalsIgnoreCase("")) {
				query = query + " and full_name like '%"
						+ search.getDialog_name() + "%'";
			}
			if (!search.getDueAmountFrom().equalsIgnoreCase("")
					|| !search.getDueAmountTo().equalsIgnoreCase("")) {
				String where = "";
				if (!search.getDialog_code().equalsIgnoreCase("")) {
					where = "and project_id like '%" + search.getDialog_code()
							+ "%'";
				}
				if (search.getDueAmountFrom().equalsIgnoreCase("")) {
					query = query
							+ " and project_id in(select project_id from (SELECT project_id,(project_cost-(SELECT COALESCE(SUM(amount),0) FROM jsinformatics.tbl_payment where myid=project_id)) AS due_amount FROM tbl_academic_project where reg_date!='1970-01-01' "
							+ where + ")tbl1 where due_amount<='"
							+ search.getDueAmountTo() + "') ";
				} else if (search.getDueAmountTo().equalsIgnoreCase("")) {
					query = query
							+ " and project_id in(select project_id from (SELECT project_id,(project_cost-(SELECT COALESCE(SUM(amount),0) FROM jsinformatics.tbl_payment where myid=project_id)) AS due_amount FROM tbl_academic_project where reg_date!='1970-01-01' "
							+ where + ")tbl1 where due_amount>='"
							+ search.getDueAmountFrom() + "') ";
				} else {
					query = query
							+ " and project_id in(select project_id from (SELECT project_id,(project_cost-(SELECT COALESCE(SUM(amount),0) FROM jsinformatics.tbl_payment where myid=project_id)) AS due_amount FROM tbl_academic_project where reg_date!='1970-01-01' "
							+ where + ")tbl1 where due_amount between '"
							+ search.getDueAmountFrom() + "' and '"
							+ search.getDueAmountTo() + "') ";
				}
			}
			if (!search.getApprovel().equalsIgnoreCase("Select")
					&& !search.getApprovel().equalsIgnoreCase("")) {
				String myapp = "SELECT distinct(myid) FROM jsinformatics.tbl_payment where myid like '"
						+ branchid
						+ "%' and payment_status='"
						+ search.getApprovel() + "' and myid like '%ACP%'";
				if (search.getApprovel().equalsIgnoreCase("Approved")) {
					myapp = myapp + " and approvel_date between '"
							+ search.getApprovalDateStart() + "' and '"
							+ search.getApprovalDateEnd() + "'";
				} else if (search.getApprovel()
						.equalsIgnoreCase("Not Approved")) {
					myapp = myapp + " and payment_date between '"
							+ search.getApprovalDateStart() + "' and '"
							+ search.getApprovalDateEnd() + "'";
				}
				query = query + " and project_id in(" + myapp + ")";
			}
			if (!search.getPaymentDateFrom().equalsIgnoreCase("")
					&& !search.getPaymentDateTo().equalsIgnoreCase("")) {
				String myapp = "SELECT distinct(myid) FROM jsinformatics.tbl_payment where myid like '"
						+ branchid
						+ "%' and myid like '%ACP%'  and payment_date between '"
						+ search.getPaymentDateFrom()
						+ "' and '"
						+ search.getPaymentDateTo() + "'";

				query = query + " and project_id in(" + myapp + ")";
			}
			if (!search.getRecievedBy().equalsIgnoreCase("Select")
					&& !search.getRecievedBy().equalsIgnoreCase("")) {
				String myapp = "SELECT distinct(myid) FROM jsinformatics.tbl_payment where myid like '"
						+ branchid
						+ "%' and myid like '%ACP%'  and received_by = '"
						+ search.getRecievedBy() + "'";

				query = query + " and project_id in(" + myapp + ")";
			}
			if (!search.getApprovedBy().equalsIgnoreCase("Select")
					&& !search.getApprovedBy().equalsIgnoreCase("")) {
				String myapp = "SELECT distinct(myid) FROM jsinformatics.tbl_payment where myid like '"
						+ branchid
						+ "%' and myid like '%ACP%'  and approved_by = '"
						+ search.getApprovedBy() + "'";

				query = query + " and project_id in(" + myapp + ")";
			}
			if (!search.getPayingDateStart().equalsIgnoreCase("")
					&& !search.getPayingDateEnd().equalsIgnoreCase("")) {
				String myapp = "SELECT myid FROM (SELECT * FROM tbl_payment_remark where myid like '"
						+ branchid
						+ "%' and myid like '%TRA%' and payment_alert between '"
						+ search.getPayingDateStart()
						+ "' and '"
						+ search.getPayingDateEnd()
						+ "' order by payment_alert DESC) as mytbl GROUP BY mytbl.myid";
				query = query + " and project_id in(" + myapp + ")";
			}
			try {
				con = basicDataSource.getConnection();
				Statement st = con.createStatement();
				System.out.println("Query2 : " + query);
				ResultSet rs = st.executeQuery(query);
				while (rs.next()) {
					NewAcademicProjectEnquiryDTO dto = new NewAcademicProjectEnquiryDTO();
					AcademicProjectDTO projectDTO = new AcademicProjectDTO();
					projectDTO.setDto(dto);
					list.add(projectDTO);

					dto.setAcademic_project_enquiry_college(rs
							.getString("college"));
					// dto.setAcademic_project_enquiry_date(rs.getString(""));
					dto.setAcademic_project_enquiry_delivery_date(rs
							.getString("delivery_date"));
					dto.setAcademic_project_enquiry_description(rs
							.getString("project_description"));
					// dto.setAcademic_project_enquiry_email_id(rs.getString(""));
					dto.setAcademic_project_enquiry_enquiry_id(rs
							.getString("enquiry_id"));
					dto.setAcademic_project_enquiry_enquiry_status(rs
							.getString("enquiry_status"));
					dto.setAcademic_project_enquiry_father_name(rs
							.getString("father_name"));
					dto.setAcademic_project_enquiry_fullname(rs
							.getString("full_name"));
					dto.setAcademic_project_enquiry_project_id(rs
							.getString("project_id"));
					dto.setAcademic_project_enquiry_project_name(rs
							.getString("project_name"));
					dto.setAcademic_project_enquiry_qualification(rs
							.getString("qualification"));
					dto.setAcademic_project_enquiry_referenceId(rs
							.getString("reference_id"));
					dto.setAcademic_project_enquiry_semester(rs
							.getString("semester"));
					Statement tst1 = con.createStatement();
					ResultSet trs1 = tst1
							.executeQuery("select * from tbl_contact where my_id='"
									+ dto.getAcademic_project_enquiry_enquiry_id()
									+ "'");
					String c_no = "";
					while (trs1.next()) {
						c_no = trs1.getString("contact_no");
					}
					trs1.close();
					tst1.close();

					dto.setAcademic_project_enquiry_contact_no(c_no);
					// dto.setAcademic_project_enquiry_reference_contact_no(c_no);
					// dto.setAcademic_project_enquiry_reference_name(rs
					// .getString(""));
					// dto.setAcademic_project_enquiry_reference_note(rs
					// .getString(""));
					dto.setEnquiry_purpose(rs.getString("purpose"));

					projectDTO.setDelivery_date(rs.getString("delivery_date"));
					projectDTO.setEnquiry_id(rs.getString("enquiry_id"));
					projectDTO.setProject_cost(rs.getString("project_cost"));
					projectDTO.setProject_description(rs
							.getString("project_description"));
					projectDTO.setProject_docs_path(rs
							.getString("project_docs_path"));
					projectDTO.setProject_id(rs.getString("project_id"));
					projectDTO.setProject_name(rs.getString("project_name"));
					projectDTO.setReg_date(rs.getString("reg_date"));
					projectDTO.setEmploye_id(rs.getString("employe_id"));

					Statement tsta = con.createStatement();
					String q = "SELECT COALESCE((SELECT max(payment_alert) FROM tbl_payment_remark where myid='"
							+ projectDTO.getProject_id()
							+ "' group by myid),(SELECT reg_date FROM tbl_academic_project where project_id='"
							+ projectDTO.getProject_id() + "')) as alertdate";
					ResultSet trsa = tsta.executeQuery(q);
					if (trsa.next()) {
						String date = trsa.getString("alertdate");
						projectDTO.setAlertDate(date);
					}
					trsa.close();
					tsta.close();
				}
				rs.close();
				st.close();
			} finally {
				con.close();
			}
		}

		return map;
	}

	public List<Employee> getApprovedbyList(String branchcode) throws Exception {
		List<Employee> employees = new ArrayList<Employee>();
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			String query = "SELECT DISTINCT(approved_by)as id,full_name FROM tbl_payment ,tbl_employee where employee_id=approved_by and payment_id like '"
					+ branchcode + "%'";
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				employees.add(new Employee(rs.getString("id"), rs
						.getString("full_name")));
			}
			st.close();
		} finally {
			con.close();
		}
		return employees;
	}

	public List<Employee> getRecievedbyList(String branchcode) throws Exception {
		List<Employee> employees = new ArrayList<Employee>();
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			String query = "SELECT DISTINCT(received_by)as id,full_name FROM tbl_payment ,tbl_employee where employee_id=received_by and payment_id like '"
					+ branchcode + "%'";
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				employees.add(new Employee(rs.getString("id"), rs
						.getString("full_name")));
			}
			st.close();
		} finally {
			con.close();
		}
		return employees;
	}

	public String savePaymentRemark(String branchcode, PaymentRemark remark)
			throws Exception {
		String ret = "error";
		Connection con = null;
		if (remark.getMyid().contains(branchcode)) {
			try {
				con = basicDataSource.getConnection();
				Statement st = con.createStatement();
				st.executeUpdate("insert into tbl_payment_remark(myid,remark_date,remark,payment_alert,employee_id,status)"
						+ "values('"
						+ remark.getMyid()
						+ "','"
						+ remark.getRemark_date()
						+ "','"
						+ remark.getRemark()
						+ "','"
						+ remark.getPayment_alert()
						+ "','"
						+ remark.getEmployee_id()
						+ "','"
						+ remark.getStatus()
						+ "')");
				st.close();
				ret = "success";
			} finally {
				con.close();
			}
		} else {
			ret = "Student not belongs to branch";
		}
		return ret;
	}

	public List<PaymentRemark> getPaymentRemarkListById(String branchcode,
			String myid) throws Exception {
		List<PaymentRemark> list = new ArrayList<PaymentRemark>();
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("SELECT * FROM tbl_payment_remark where myid='"
							+ myid + "'");
			while (rs.next()) {
				PaymentRemark remark = new PaymentRemark();
				remark.setEmployee_id(rs.getString("employee_id"));
				remark.setMyid(rs.getString("myid"));
				remark.setPayment_alert(rs.getString("payment_alert"));
				remark.setRemark(rs.getString("remark"));
				remark.setRemark_date(rs.getString("remark_date"));
				remark.setStatus(rs.getString("status"));
				list.add(remark);
			}
			st.close();
		} finally {
			con.close();
		}
		return list;
	}

	public Map<EnquiryType, List> getAllDueAmount(String branchId)
			throws Exception {
		Map<EnquiryType, List> map = new HashMap<EnquiryType, List>();
		List<TrainingRegistrationDTO> list = new ArrayList<TrainingRegistrationDTO>();
		map.put(EnquiryType.Training, list);
		List<AcademicProjectDTO> academicList = new ArrayList<AcademicProjectDTO>();
		map.put(EnquiryType.Academic_Project, academicList);
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			String query = "select * from tbl_registration where registration_id like '"
					+ branchId + "%' ";
			String subQuery = " and registration_id in( select reg_id from (SELECT registration_id reg_id,(total_amount-discount_amount-(SELECT COALESCE(SUM(amount),0) FROM jsinformatics.tbl_payment where myid=reg1.registration_id)) AS due_amount FROM jsinformatics.tbl_registration reg1 )tbl1 where due_amount> '0')";
			query = query + subQuery;
			System.out.println(query);
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				TrainingRegistrationDTO dto = new TrainingRegistrationDTO();
				list.add(dto);
				dto.setRegistration_id(rs.getString("registration_id"));
				dto.setEnquiry_id(rs.getString("enquiry_id"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setBatch_time_start(rs.getString("batch_time_start"));
				dto.setBatch_time_end(rs.getString("batch_time_end"));
				dto.setEmployee_id(rs.getString("employee_id"));
				dto.setTotal_amount(rs.getInt("total_amount"));
				dto.setDiscount_amount(rs.getInt("discount_amount"));
				dto.setDiscount_detail(rs.getString("discount_detail"));
				dto.setRegisterForCourse(rs.getString("register_for_course"));
				dto.setAddress(rs.getString("address"));
				dto.setDate_of_birth(rs.getString("date_of_birth"));
				dto.setEnrollment_no(rs.getString("enrollment_no"));
				dto.setPhoto_path(rs.getString("photo_path"));
				dto.setPayment_status(rs.getString("payment_status"));
				dto.setReg_employee_id(rs.getString("employee_id"));

				int totalAmt = rs.getInt("total_amount");
				int discountAmt = rs.getInt("discount_amount");
				int payableAmt = (totalAmt - discountAmt);
				dto.setTotal_amount(totalAmt);
				dto.setDiscount_amount(discountAmt);
				dto.setPayable_amount(payableAmt);

				String que = "select * from tbl_enquiry where enquiry_id='"
						+ dto.getEnquiry_id() + "'";
				// //System.out.println(que);
				Statement st1 = con.createStatement();
				ResultSet rs1 = st1.executeQuery(que);
				if (rs1.next()) {
					dto.setFullname(rs1.getString("full_name"));
					dto.setFather_name(rs1.getString("father_name"));
					dto.setQualification(rs1.getString("qualification"));
					dto.setSemester(rs1.getString("semester"));
					dto.setPreferredtime_start(rs1
							.getString("preferred_time_start"));
					dto.setJoining_date(rs1.getString("joining_date"));
					dto.setReferenceId(rs1.getString("reference_id"));
					dto.setEnquiry_status(rs1.getString("enquiry_status"));
					dto.setPreferredtime_end(rs1
							.getString("preferred_time_end"));
					dto.setEnquiry_date(rs1.getString("enquiry_date"));

					dto.setCollege(rs1.getString("college"));
				}
				rs1.close();
				st1.close();

				que = "select * from tbl_contact where my_id='"
						+ dto.getEnquiry_id() + "'";
				// //System.out.println(que);
				st1 = con.createStatement();
				rs1 = st1.executeQuery(que);
				if (rs1.next()) {
					dto.setContact_no(rs1.getString("contact_no"));
				} else {
					dto.setContact_no("");
				}
				rs1.close();
				st1.close();

				que = "select * from tbl_email where my_id='"
						+ dto.getEnquiry_id() + "'";
				// //System.out.println(que);
				st1 = con.createStatement();
				rs1 = st1.executeQuery(que);
				if (rs1.next()) {
					dto.setEmail_id(rs1.getString("email_id"));
				} else {
					dto.setEmail_id("");
				}
				rs1.close();
				st1.close();

				que = "select course_name from tbl_cource where course_id='"
						+ dto.getRegisterForCourse() + "'";
				// //System.out.println(que);
				st1 = con.createStatement();
				rs1 = st1.executeQuery(que);
				if (rs1.next()) {
					dto.setCoursename(rs1.getString("course_name"));
				} else {
					dto.setCoursename("");
				}
				rs1.close();
				st1.close();

				que = "select * from tbl_reference where reference_id='"
						+ dto.getReferenceId() + "'";
				// //System.out.println(que);
				st1 = con.createStatement();
				rs1 = st1.executeQuery(que);
				if (rs1.next()) {
					dto.setReference_name(rs1.getString("full_name"));
					dto.setReference_contact_no(rs1.getString("contact_no"));
				}
				rs1.close();
				st1.close();

				que = "select * from relation_with_reference where myid='"
						+ dto.getEnquiry_id() + "'";
				st1 = con.createStatement();
				rs1 = st1.executeQuery(que);
				if (rs1.next()) {
					dto.setReference_note(rs1.getString("note"));
				}
				rs1.close();
				st1.close();

				Statement tsta = con.createStatement();
				String q = "SELECT COALESCE((SELECT max(payment_alert) FROM tbl_payment_remark where myid='"
						+ dto.getRegistration_id()
						+ "' group by myid),(SELECT reg_date FROM tbl_registration where registration_id='"
						+ dto.getRegistration_id() + "')) as alertdate";
				ResultSet trsa = tsta.executeQuery(q);
				if (trsa.next()) {
					String date = trsa.getString("alertdate");
					dto.setAlertDate(date);
				}
				trsa.close();
				tsta.close();
			}
			st.close();

			st = con.createStatement();
			query = "select * from tbl_academic_project where reg_date!='1970-01-01' ";
			subQuery = " and project_id in(select project_id from (SELECT project_id,(project_cost-(SELECT COALESCE(SUM(amount),0) FROM jsinformatics.tbl_payment where myid=project_id)) AS due_amount FROM tbl_academic_project where reg_date!='1970-01-01')tbl1 where due_amount>'0')";
			query = query + subQuery;
			System.out.println(query);
			rs = st.executeQuery(query);
			while (rs.next()) {
				AcademicProjectDTO dto = new AcademicProjectDTO();
				NewAcademicProjectEnquiryDTO projectEnquiryDTO = new NewAcademicProjectEnquiryDTO();
				academicList.add(dto);
				dto.setDto(projectEnquiryDTO);
				dto.setDelivery_date(rs.getString("delivery_date"));
				dto.setEmploye_id(rs.getString("employe_id"));
				dto.setEnquiry_id(rs.getString("enquiry_id"));
				dto.setPayment_status(rs.getString("payment_status"));
				dto.setProject_cost(rs.getString("project_cost"));
				dto.setProject_description(rs.getString("project_description"));
				dto.setProject_docs_path(rs.getString("project_docs_path"));
				dto.setProject_id(rs.getString("project_id"));
				dto.setProject_name(rs.getString("project_name"));
				dto.setReg_date(rs.getString("reg_date"));

				String que = "select * from tbl_enquiry where enquiry_id='"
						+ dto.getEnquiry_id() + "'";
				Statement st1 = con.createStatement();
				ResultSet rs1 = st1.executeQuery(que);
				if (rs1.next()) {
					projectEnquiryDTO.setAcademic_project_enquiry_fullname(rs1
							.getString("full_name"));
					projectEnquiryDTO
							.setAcademic_project_enquiry_father_name(rs1
									.getString("father_name"));
					projectEnquiryDTO
							.setAcademic_project_enquiry_qualification(rs1
									.getString("qualification"));
					projectEnquiryDTO.setAcademic_project_enquiry_semester(rs1
							.getString("semester"));
					projectEnquiryDTO
							.setAcademic_project_enquiry_referenceId(rs1
									.getString("reference_id"));
					projectEnquiryDTO
							.setAcademic_project_enquiry_enquiry_status(rs1
									.getString("enquiry_status"));
					projectEnquiryDTO.setAcademic_project_enquiry_date(rs1
							.getString("enquiry_date"));
					projectEnquiryDTO.setAcademic_project_enquiry_college(rs1
							.getString("college"));
				}
				rs1.close();
				st1.close();

				que = "select * from tbl_contact where my_id='"
						+ dto.getEnquiry_id() + "'";
				st1 = con.createStatement();
				rs1 = st1.executeQuery(que);
				if (rs1.next()) {
					projectEnquiryDTO
							.setAcademic_project_enquiry_contact_no(rs1
									.getString("contact_no"));
				} else {
					projectEnquiryDTO
							.setAcademic_project_enquiry_contact_no("");
				}
				rs1.close();
				st1.close();

				que = "select * from tbl_email where my_id='"
						+ dto.getEnquiry_id() + "'";
				// //System.out.println(que);
				st1 = con.createStatement();
				rs1 = st1.executeQuery(que);
				if (rs1.next()) {
					projectEnquiryDTO.setAcademic_project_enquiry_email_id(rs1
							.getString("email_id"));
				} else {
					projectEnquiryDTO.setAcademic_project_enquiry_email_id("");
				}
				rs1.close();
				st1.close();

				que = "select * from tbl_reference where reference_id='"
						+ projectEnquiryDTO
								.getAcademic_project_enquiry_referenceId()
						+ "'";
				st1 = con.createStatement();
				rs1 = st1.executeQuery(que);
				if (rs1.next()) {
					projectEnquiryDTO
							.setAcademic_project_enquiry_reference_name(rs1
									.getString("full_name"));
					projectEnquiryDTO
							.setAcademic_project_enquiry_reference_contact_no(rs1
									.getString("contact_no"));
				}
				rs1.close();
				st1.close();

				que = "select * from relation_with_reference where myid='"
						+ dto.getEnquiry_id() + "'";
				st1 = con.createStatement();
				rs1 = st1.executeQuery(que);
				if (rs1.next()) {
					projectEnquiryDTO
							.setAcademic_project_enquiry_reference_note(rs1
									.getString("note"));
				}
				rs1.close();
				st1.close();

				Statement tsta = con.createStatement();
				String q = "SELECT COALESCE((SELECT max(payment_alert) FROM tbl_payment_remark where myid='"
						+ dto.getProject_id()
						+ "' group by myid),(SELECT reg_date FROM tbl_academic_project where project_id='"
						+ dto.getProject_id() + "')) as alertdate";
				ResultSet trsa = tsta.executeQuery(q);
				if (trsa.next()) {
					String date = trsa.getString("alertdate");
					dto.setAlertDate(date);
				}
				trsa.close();
				tsta.close();

			}
			st.close();
		} finally {
			con.close();
		}
		return map;
	}

	public Payment makePayment(Payment payment, String branchcode)
			throws Exception {
		Payment tPayment = null;
		Connection con = null;
		long payment_id_long = 0;
		try {
			con = basicDataSource.getConnection();
			con.setAutoCommit(false);

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from tbl_counter");
			if (rs.next()) {
				payment_id_long = rs.getLong("payment_id");
			}
			rs.close();
			st.close();

			String base = payment.getReceived_by().substring(0, 12);
			Date date = new Date();

			String tdate = "" + date.getDate();
			String tmonth = "" + (1 + date.getMonth());
			String tyear = "" + (1900 + date.getYear());

			String fdate = "00";
			String fmonth = "00";
			String fyear = "0000";

			fdate = fdate.substring(0, (fdate.length() - tdate.length()));
			fdate = fdate + tdate;

			fmonth = fmonth.substring(0, (fmonth.length() - tmonth.length()));
			fmonth = fmonth + tmonth;

			fyear = fyear.substring(0, (fyear.length() - tyear.length()));
			fyear = fyear + tyear;

			String counter = "0000";
			String enq_id = "" + payment_id_long;
			counter = counter
					.substring(0, (counter.length() - enq_id.length()));
			counter = counter + enq_id;

			base = base + "PAY" + fdate + fmonth + fyear;
			String payment_id = base + counter;

			payment.setPayment_id(payment_id);

			if (payment.getMyid().contains(branchcode)) {
				st = con.createStatement();
				st.executeUpdate("insert into tbl_payment (payment_id,amount,payment_date,myid,received_by,source,mode,transfer_code,bank_name,payment_status,approvel_date) values ('"
						+ payment.getPayment_id()
						+ "',"
						+ payment.getAmount()
						+ ",'"
						+ payment.getPayment_date()
						+ "','"
						+ payment.getMyid()
						+ "','"
						+ payment.getReceived_by()
						+ "','"
						+ payment.getSource()
						+ "','"
						+ payment.getPayment_mode()
						+ "','"
						+ payment.getTransfer_code()
						+ "','"
						+ payment.getTransfer_bank_name()
						+ "','Not Approved','2000-01-01')");
				st.close();
				payment_id_long++;
				st = con.createStatement();
				st.executeUpdate("update tbl_counter set payment_id="
						+ payment_id_long + " where myid=1");
				st.close();
				tPayment = payment;
			}

			StudentSMSDTO smsdto = new StudentSMSDTO();
			smsdto.setDate(new SimpleDateFormat("yyyy-MM-dd")
					.format(new Date()));
			smsdto.setFixid(payment_id);
			smsdto.setForwhat("Payment");
			smsdto.setMessage(new MessagePropertyReader()
					.readMessage(MessagePropertyReader.TRAINING_PAYMENT));
			smsdto.setNumber(payment.getContactNo());
			smsdto.setStatus("new sms");
			studentSMSDAO.saveDetail(smsdto, con);
			con.commit();
		} finally {
			con.close();
		}
		return tPayment;
	}

	public String approvePayment(Payment payment, String branchcode)
			throws Exception {
		String ret = "error";
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			if (payment.getApproved_by().contains(branchcode)) {
				Statement st = con.createStatement();
				st.executeUpdate("update tbl_payment set payment_status = 'Approved', approvel_date='"
						+ payment.getApprovel_date()
						+ "' , approved_by='"
						+ payment.getApproved_by()
						+ "'  where payment_id='"
						+ payment.getPayment_id() + "'");
				st.close();

				String id = "";
				String que = "Select myid from tbl_payment where payment_id='"
						+ payment.getPayment_id() + "'";
				st = con.createStatement();
				ResultSet rs = st.executeQuery(que);
				if (rs.next()) {
					id = rs.getString("myid");
				}
				st.close();
				if (id.contains("TRA")) {
					st = con.createStatement();
					rs = st.executeQuery("SELECT (SELECT COALESCE((total_amount - discount_amount),0) AS mytotal FROM tbl_registration where registration_id='"
							+ id
							+ "')-(Select COALESCE(SUM(amount),0) as mypay from tbl_payment where payment_status = 'Approved' and myid = '"
							+ id + "')");
					if (rs.next()) {
						if (rs.getInt(1) <= 0) {
							Statement st1 = con.createStatement();
							st1.executeUpdate("update tbl_registration set payment_status = 'no due' where registration_id='"
									+ id + "'");
							st1.close();
						}
					}
					st.close();
				} else if (id.contains("ACP")) {
					st = con.createStatement();
					rs = st.executeQuery("SELECT (SELECT COALESCE(project_cost,0) AS mytotal FROM tbl_academic_project where project_id='"
							+ id
							+ "')-(Select COALESCE(SUM(amount),0) as mypay from tbl_payment where payment_status = 'Approved' and myid = '"
							+ id + "')");
					if (rs.next()) {
						if (rs.getInt(1) <= 0) {
							Statement st1 = con.createStatement();
							st1.executeUpdate("update tbl_academic_project set payment_status = 'no due' where project_id='"
									+ id + "'");
							st1.close();
						}
					}
					st.close();
				}
				ret = "success";
			}

		} finally {
			con.close();
		}
		return ret;
	}

	public String updatePaymentDetail(Payment payment, String branchcode)
			throws Exception {
		String ret = "error";
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			if (payment.getMyid().contains(branchcode)) {
				Statement st = con.createStatement();
				st.executeUpdate("update tbl_payment set amount="
						+ payment.getAmount() + ", payment_date='"
						+ payment.getPayment_date() + "', myid='"
						+ payment.getMyid() + "', received_by='"
						+ payment.getReceived_by() + "', source='"
						+ payment.getSource() + "' where payment_id='"
						+ payment.getPayment_id() + "'");
				st.close();
				ret = "success";
			}
		} finally {
			con.close();
		}
		return ret;
	}

	public Payment getPaymentDetailByPaymentId(Payment payment,
			String branchcode) throws Exception {
		Payment tpayment = null;
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			if (payment.getPayment_id().contains(branchcode)) {
				Statement st = con.createStatement();
				ResultSet rs = st
						.executeQuery("select * from tbl_payment where payment_id='"
								+ payment.getPayment_id() + "'");
				if (rs.next()) {
					payment.setPayment_id(rs.getString("payment_id"));
					payment.setAmount(rs.getInt("amount"));
					payment.setPayment_date(rs.getString("payment_date"));
					payment.setMyid(rs.getString("myid"));
					payment.setReceived_by(rs.getString("received_by"));
					payment.setSource(rs.getString("source"));
					payment.setPayment_mode(rs.getString("mode"));
					payment.setPayment_status(rs.getString("payment_status"));
					payment.setApprovel_date(rs.getString("approvel_date"));
					payment.setApproved_by(rs.getString("approved_by"));
					tpayment = payment;
				}
				rs.close();
				st.close();
			}
		} finally {
			con.close();
		}
		return tpayment;
	}

	public List<Payment> getAllPaymentDetailById(Payment payment,
			String branchcode) throws Exception {
		List<Payment> paymentList = new ArrayList<Payment>();
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("select * from tbl_payment where payment_id like '"
							+ branchcode
							+ "%' and  myid='"
							+ payment.getMyid()
							+ "' order by payment_date DESC");
			while (rs.next()) {
				Payment tpayment = new Payment();
				tpayment.setPayment_id(rs.getString("payment_id"));
				tpayment.setAmount(rs.getInt("amount"));
				tpayment.setPayment_date(rs.getString("payment_date"));
				tpayment.setMyid(rs.getString("myid"));
				tpayment.setReceived_by(rs.getString("received_by"));
				tpayment.setSource(rs.getString("source"));
				tpayment.setPayment_mode(rs.getString("mode"));
				tpayment.setPayment_status(rs.getString("payment_status"));
				tpayment.setApprovel_date(rs.getString("approvel_date"));
				tpayment.setApproved_by(rs.getString("approved_by"));
				if (tpayment.getApproved_by() == null
						|| tpayment.getApproved_by().equalsIgnoreCase("null")) {
					tpayment.setApproved_by("NA");
					tpayment.setApproved_by_name("NA");
				} else {
					Employee employee = employeeDAO.getEmployeeDetailByEmployeeId(new Employee(
									tpayment.getApproved_by()), con);
					tpayment.setApproved_by_name(employee.getFull_name());
				}

				Employee employee = employeeDAO
						.getEmployeeDetailByEmployeeId(
								new Employee(tpayment.getReceived_by()), con);
				tpayment.setReceived_by_name(employee.getFull_name());
				paymentList.add(tpayment);
			}
			rs.close();
			st.close();
		} finally {
			con.close();
		}
		return paymentList;
	}

	public int getDueAmount(String regId) throws Exception {
		int amount = 0;
		Connection con = null;
		try {
			Payment tpayment = new Payment();
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("select amount from tbl_payment where myid='"
							+ regId + "'");
			while (rs.next()) {
				amount = amount + rs.getInt("amount");
			}
			rs.close();
			st.close();
			if (regId.contains("TRA")) {
				st = con.createStatement();
				rs = st.executeQuery("select discount_amount,total_amount from tbl_registration where registration_id='"
						+ regId + "'");
				if (rs.next()) {
					int discount = rs.getInt("discount_amount");
					int total = rs.getInt("total_amount");
					amount = total - discount - amount;
				}
				rs.close();
				st.close();
			} else if (regId.contains("ACP")) {
				st = con.createStatement();
				rs = st.executeQuery("SELECT project_cost FROM jsinformatics.tbl_academic_project where project_id='"
						+ regId + "';");
				if (rs.next()) {
					int project_cost = rs.getInt("project_cost");
					amount = project_cost - amount;
				}
				rs.close();
				st.close();
			}

		} finally {
			con.close();
		}
		return amount;
	}

	public List getAllNotApproveInfo(String branch) throws Exception {
		List list = new ArrayList();
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			String query = "SELECT * FROM tbl_payment payment where payment.payment_status='Not Approved'  and payment_id like '"
					+ branch + "%' order by payment_date";
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				Payment payment = new Payment();
				payment.setPayment_id(rs.getString("payment_id"));
				payment.setAmount(rs.getInt("amount"));
				payment.setPayment_date(rs.getString("payment_date"));
				payment.setMyid(rs.getString("myid"));
				payment.setReceived_by(rs.getString("received_by"));
				payment.setSource(rs.getString("source"));
				payment.setPayment_mode(rs.getString("mode"));
				payment.setPayment_status(rs.getString("payment_status"));
				payment.setApprovel_date(rs.getString("approvel_date"));
				payment.setApproved_by(rs.getString("approved_by"));

				Statement st1 = con.createStatement();
				ResultSet rs1 = st1
						.executeQuery("SELECT full_name FROM tbl_employee where employee_id='"
								+ payment.getReceived_by() + "'");
				while (rs1.next()) {
					payment.setReceiverName(rs1.getString("full_name"));
				}
				st1.close();

				String que = "SELECT full_name from tbl_enquiry enq ,";
				if (payment.getSource().equalsIgnoreCase("Training")) {
					que = que
							+ "tbl_registration reg where reg.enquiry_id=enq.enquiry_id and reg.registration_id='"
							+ payment.getMyid() + "'";
					st1 = con.createStatement();
					rs1 = st1.executeQuery(que);
					while (rs1.next()) {
						payment.setCandidateName(rs1.getString("full_name"));
					}
					st1.close();

					Statement tsta = con.createStatement();
					String q = "SELECT COALESCE((SELECT max(payment_alert) FROM tbl_payment_remark where myid='"
							+ payment.getMyid()
							+ "' group by myid),(SELECT reg_date FROM tbl_registration where registration_id='"
							+ payment.getMyid() + "')) as alertdate";
					ResultSet trsa = tsta.executeQuery(q);
					if (trsa.next()) {
						String date = trsa.getString("alertdate");
						payment.setAlertDate(date);
					}
					trsa.close();
					tsta.close();
				} else if (payment.getSource().equalsIgnoreCase(
						"Academic Project")) {
					que = que
							+ "tbl_academic_project reg where reg.enquiry_id=enq.enquiry_id and reg.project_id='"
							+ payment.getMyid() + "'";
					st1 = con.createStatement();
					rs1 = st1.executeQuery(que);
					while (rs1.next()) {
						payment.setCandidateName(rs1.getString("full_name"));
					}
					st1.close();

					Statement tsta = con.createStatement();
					String q = "SELECT COALESCE((SELECT max(payment_alert) FROM tbl_payment_remark where myid='"
							+ payment.getMyid()
							+ "' group by myid),(SELECT reg_date FROM tbl_academic_project where project_id='"
							+ payment.getMyid() + "')) as alertdate";
					ResultSet trsa = tsta.executeQuery(q);
					if (trsa.next()) {
						String date = trsa.getString("alertdate");
						payment.setAlertDate(date);
					}
					trsa.close();
					tsta.close();
				}

				list.add(payment);
			}
			st.close();
		} finally {
			con.close();
		}
		return list;
	}

	public List get(String branch) throws Exception {
		List list = new ArrayList();
		Connection con = null;
		try {
			con = basicDataSource.getConnection();
			Statement st = con.createStatement();
			String query = "SELECT * FROM tbl_payment payment where payment.payment_status='Not Approved'  and payment_id like '"
					+ branch + "%' order by payment_date";
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {

			}
			st.close();
		} finally {
			con.close();
		}
		return list;
	}

	public static void main(String args[]) {

	}

}
//
// String query = "select * from ";
// if (!source.equalsIgnoreCase("Select")) {
// if (source.contains("Training")) {
// query = query + " tbl_enquiry where enquiry_id like '"
// + branchid + "%' ";
// if (!code.equalsIgnoreCase("")) {
// query = query
// +
// " and enquiry_id in (select enquiry_id from tbl_registration where registration_id like '%"
// + code + "%')";
// }
// if (!fullName.equalsIgnoreCase("")) {
// query = query
// + " and full_name like '%"
// + fullName
// + "%' and enquiry_id in (select enquiry_id from tbl_registration)";
// }
