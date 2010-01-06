using System.Collections.Generic;


namespace eshop.core.Dao
{
    public interface IDao<TEntity>
    {
        TEntity FindById(long id);
        void Update(TEntity entity);
        TEntity Save(TEntity entity);
        void Delete(TEntity entity);
        List<TEntity> FindAll();
        TEntity Load(TEntity entity);
    }
}