package com.js.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.js.dto.NewTrainingEnquiryDTO;
import com.js.dto.ReferanceDTO;

public interface ReferanceDAO {
	public void saveReferance(Connection con,
			ReferanceDTO referanceDTO) throws SQLException ;
}
