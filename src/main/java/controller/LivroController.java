package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Company;
import model.Livro;
import model.ModelException;
import model.dao.CompanyDAO;
import model.dao.DAOFactory;
import model.dao.LivroDAO;

@WebServlet(urlPatterns = {"/livros", "/livro/form", "/livro/insert", "/livro/update", "/livro/delete"})
public class LivroController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getRequestURI();
		switch (action) {
			case "/crud-manager/livro/form":
				listCompanies(req);
				req.setAttribute("action", "insert");
				ControllerUtil.forward(req, resp, "/form-livro.jsp");
				break;
			case "/crud-manager/livro/update":
				listCompanies(req);
				Livro l = loadLivro(req);
				req.setAttribute("livro", l);
				req.setAttribute("action", "update");
				ControllerUtil.forward(req, resp, "/form-livro.jsp");
				break;
			default:
				listLivros(req);
				ControllerUtil.forward(req, resp, "/livros.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getRequestURI();
		switch (action) {
			case "/crud-manager/livro/insert":
				insertLivro(req);
				break;
			case "/crud-manager/livro/update":
				updateLivro(req);
				break;
			case "/crud-manager/livro/delete":
				deleteLivro(req);
				break;
		}
		ControllerUtil.redirect(resp, req.getContextPath() + "/livros");
	}

	private void insertLivro(HttpServletRequest req) {
		Livro livro = extractLivroFromRequest(req);
		LivroDAO dao = DAOFactory.createDAO(LivroDAO.class);
		try {
			if (dao.save(livro)) {
				ControllerUtil.sucessMessage(req, "Livro salvo com sucesso.");
			} else {
				ControllerUtil.errorMessage(req, "Erro ao salvar livro.");
			}
		} catch (ModelException e) {
			e.printStackTrace();
			ControllerUtil.errorMessage(req, e.getMessage());
		}
	}

	private void updateLivro(HttpServletRequest req) {
		Livro livro = loadLivro(req);
		if (livro != null) {
			Livro novo = extractLivroFromRequest(req);
			livro.setTitulo(novo.getTitulo());
			livro.setAutor(novo.getAutor());
			livro.setEditora(novo.getEditora());
			livro.setAnoPublicacao(novo.getAnoPublicacao());
			livro.setQuantidade(novo.getQuantidade());
			livro.setCompany(novo.getCompany());

			LivroDAO dao = DAOFactory.createDAO(LivroDAO.class);
			try {
				if (dao.update(livro)) {
					ControllerUtil.sucessMessage(req, "Livro atualizado com sucesso.");
				} else {
					ControllerUtil.errorMessage(req, "Erro ao atualizar livro.");
				}
			} catch (ModelException e) {
				e.printStackTrace();
				ControllerUtil.errorMessage(req, e.getMessage());
			}
		}
	}

	private void deleteLivro(HttpServletRequest req) {
		int id = Integer.parseInt(req.getParameter("id"));
		LivroDAO dao = DAOFactory.createDAO(LivroDAO.class);
		try {
			Livro livro = dao.findById(id);
			if (livro != null && dao.delete(livro)) {
				ControllerUtil.sucessMessage(req, "Livro removido com sucesso.");
			} else {
				ControllerUtil.errorMessage(req, "Erro ao deletar livro.");
			}
		} catch (ModelException e) {
			e.printStackTrace();
			ControllerUtil.errorMessage(req, e.getMessage());
		}
	}

	private void listLivros(HttpServletRequest req) {
		LivroDAO dao = DAOFactory.createDAO(LivroDAO.class);
		try {
			List<Livro> livros = dao.listAll();
			req.setAttribute("livros", livros);
		} catch (ModelException e) {
			e.printStackTrace();
		}
	}

	private void listCompanies(HttpServletRequest req) {
		CompanyDAO dao = DAOFactory.createDAO(CompanyDAO.class);
		try {
			req.setAttribute("companies", dao.listAll());
		} catch (ModelException e) {
			e.printStackTrace();
		}
	}

	private Livro loadLivro(HttpServletRequest req) {
		int id = Integer.parseInt(req.getParameter("id"));
		LivroDAO dao = DAOFactory.createDAO(LivroDAO.class);
		try {
			return dao.findById(id);
		} catch (ModelException e) {
			e.printStackTrace();
			ControllerUtil.errorMessage(req, e.getMessage());
		}
		return null;
	}

	private Livro extractLivroFromRequest(HttpServletRequest req) {
		Livro livro = new Livro();
		livro.setTitulo(req.getParameter("titulo"));
		livro.setAutor(req.getParameter("autor"));
		livro.setEditora(req.getParameter("editora"));
		livro.setAnoPublicacao(Integer.parseInt(req.getParameter("anoPublicacao")));
		livro.setQuantidade(req.getParameter("quantidade"));
		int companyId = Integer.parseInt(req.getParameter("company"));
		livro.setCompany(new Company(companyId));
		return livro;
	}
}
