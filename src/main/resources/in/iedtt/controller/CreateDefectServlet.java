package in.iedtt.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.iedtt.dao.DefectDao;
import in.iedtt.entity.Defect;
import in.iedtt.entity.Response;
import in.iedtt.util.Mail;

public class CreateDefectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CreateDefectServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Defect creation Requested %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		Defect defect = new Defect();
		DefectDao defectDao = new DefectDao();
		defect = defectDao.getNewDefect(request);
		Response logDefectResponse = defectDao.logDefect(defect);
		request.setAttribute("response", logDefectResponse);
		defect = (Defect) logDefectResponse.getResponseObject();
		String body = "New Defect created under project name : " + defect.getProjectName() + " and Module name is : " + defect.getModuleName();
		body+="\n Defect details are : " + defect.getDescription();
		Mail.sendNotification(defect.getAssignedTo()+"," + defect.getIdentifiedBy(), "Defect ID : "+defect.getId(), body);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("./home.jsp");
	    requestDispatcher.forward(request, response);
	}
}
