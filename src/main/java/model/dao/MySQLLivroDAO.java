package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.Company;
import model.Livro;
import model.ModelException;

public class MySQLLivroDAO implements LivroDAO {

	@Override
	public boolean save(Livro livro) throws ModelException {
		DBHandler db = new DBHandler();
		String sql = "INSERT INTO Livro VALUES (DEFAULT, ?, ?, ?, ?, ?, ?)";
		db.prepareStatement(sql);
		db.setString(1, livro.getTitulo());
		db.setString(2, livro.getAutor());
		db.setString(3, livro.getEditora());
		db.setInt(4, livro.getAnoPublicacao());
		db.setString(5, livro.getQuantidade());
		db.setInt(6, livro.getCompany().getId());
		return db.executeUpdate() > 0;
	}

	@Override
	public boolean update(Livro livro) throws ModelException {
		DBHandler db = new DBHandler();
		String sql = "UPDATE Livro SET titulo = ?, autor = ?, ano_publicacao = ?, quantidade = ?, companies_id = ? WHERE id = ?";
		db.prepareStatement(sql);
		db.setString(1, livro.getTitulo());
		db.setString(2, livro.getAutor());
		db.setInt(3, livro.getAnoPublicacao());
		db.setString(4, livro.getQuantidade());
		db.setInt(5, livro.getCompany().getId());
		db.setInt(6, livro.getId());
		return db.executeUpdate() > 0;
	}

	@Override
	public boolean delete(Livro livro) throws ModelException {
		DBHandler db = new DBHandler();
		String sql = "DELETE FROM Livro WHERE id = ?";
		db.prepareStatement(sql);
		db.setInt(1, livro.getId());
		return db.executeUpdate() > 0;
	}

	@Override
	public List<Livro> listAll() throws ModelException {
		List<Livro> livros = new ArrayList<>();
		DBHandler db = new DBHandler();
		String sql = "SELECT * FROM Livro ORDER BY titulo";
		db.createStatement();
		db.executeQuery(sql);

		while (db.next()) {
			Livro livro = createLivro(db);
			livros.add(livro);
		}

		return livros;
	}

	@Override
	public Livro findById(int id) throws ModelException {
		DBHandler db = new DBHandler();
		String sql = "SELECT * FROM Livro WHERE id = ?";
		db.prepareStatement(sql);
		db.setInt(1, id);
		db.executeQuery();
		if (db.next()) {
			return createLivro(db);
		}
		return null;
	}

	private Livro createLivro(DBHandler db) throws ModelException {
		Livro l = new Livro(db.getInt("id"));
		l.setTitulo(db.getString("titulo"));
		l.setAutor(db.getString("autor"));
		l.setEditora(db.getString("editora"));
		l.setAnoPublicacao(db.getInt("ano_publicacao"));
		l.setQuantidade(db.getString("quantidade"));

		CompanyDAO companyDAO = DAOFactory.createDAO(CompanyDAO.class);
		Company company = companyDAO.findById(db.getInt("companies_id"));
		l.setCompany(company);

		return l;
	}
}
