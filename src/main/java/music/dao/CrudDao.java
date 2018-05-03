package music.dao;

public interface CrudDao<T> extends Dao<T> {

	void add(T obj);
	
	T getById(int id);
	
	void update(T obj);
	
	void remove(int id);
}
