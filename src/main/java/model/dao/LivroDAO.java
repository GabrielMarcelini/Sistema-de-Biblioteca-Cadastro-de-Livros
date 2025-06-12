package model.dao;

import java.util.List;
import model.Livro;
import model.ModelException;

public interface LivroDAO {
	boolean save(Livro livro) throws ModelException;
	boolean update(Livro livro) throws ModelException;
	boolean delete(Livro livro) throws ModelException;
	List<Livro> listAll() throws ModelException;
	Livro findById(int id) throws ModelException;
}
