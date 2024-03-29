﻿using System;
using System.Collections.Generic;
using eshop.core.Domain;
using NHibernate;
using NHibernate.Criterion;


namespace eshop.core.Dao.Impl
{
    public abstract class AbstractNHibernateDao<T> : IDao<T> where T: DomainObject
    {


        /// <summary>
        /// Loads an instance of type T from the DB based on its ID.
        /// </summary>
        public T FindById(long id)
        {
            return Session.Load<T>(id);
        }

        public void Update(T entity)
        {
            Session.Update(entity);
        }

        /// <summary>
        /// Loads every instance of the requested type with no filtering.
        /// </summary>
        public List<T> GetAll()
        {
            return GetByCriteria();
        }

        /// <summary>
        /// Loads every instance of the requested type using the supplied <see cref="ICriterion" />.
        /// If no <see cref="ICriterion" /> is supplied, this behaves like <see cref="GetAll" />.
        /// </summary>
        public List<T> GetByCriteria(params ICriterion[] criterion)
        {
            ICriteria criteria = Session.CreateCriteria(persitentType);

            foreach (ICriterion criterium in criterion)
            {
                criteria.Add(criterium);
            }

            return criteria.List<T>() as List<T>;
        }

        public List<T> GetByExample(T exampleInstance, params string[] propertiesToExclude)
        {
            ICriteria criteria = Session.CreateCriteria(persitentType);
            Example example = Example.Create(exampleInstance);

            foreach (string propertyToExclude in propertiesToExclude)
            {
                example.ExcludeProperty(propertyToExclude);
            }

            criteria.Add(example);

            return criteria.List<T>() as List<T>;
        }

        /// <summary>
        /// Looks for a single instance using the example provided.
        /// </summary>
        /// <exception cref="NonUniqueResultException" />
        public T GetUniqueByExample(T exampleInstance, params string[] propertiesToExclude)
        {
            List<T> foundList = GetByExample(exampleInstance, propertiesToExclude);

            if (foundList.Count > 1)
            {
                throw new NonUniqueResultException(foundList.Count);
            }

            if (foundList.Count > 0)
            {
                return foundList[0];
            }
            else
            {
                return default(T);
            }
        }

        /// <summary>
        /// For entities that have assigned ID's, you must explicitly call Save to add a new one.
        /// See http://www.hibernate.org/hib_docs/reference/en/html/mapping.html#mapping-declaration-id-assigned.
        /// </summary>
        public T Save(T entity)
        {
            Session.Save(entity);
            return entity;
        }



        /// <summary>
        /// For entities with automatatically generated IDs, such as identity, SaveOrUpdate may 
        /// be called when saving a new entity.  SaveOrUpdate can also be called to _update_ any 
        /// entity, even if its ID is assigned.
        /// </summary>
        public T SaveOrUpdate(T entity)
        {
            Session.SaveOrUpdate(entity);
            return entity;
        }

        public void Delete(T entity)
        {
            Session.Delete(entity);
        }

        public List<T> FindAll()
        {
            return GetByCriteria();
        }

        public T Load(T entity)
        {
            return Session.Load<T>(entity.Id);
        }

        protected ICriteria CreateCriteria()
        {
            return Session.CreateCriteria(typeof(T));
        }
        

        /// <summary>
        /// Exposes the ISession used within the DAO.
        /// </summary>
        protected ISession Session
        {
            get
            {
                return NHibernateSessionManager.Instance.GetSession();
            }
        }

        private Type persitentType = typeof(T);
        protected readonly string SessionFactoryConfigPath;
    }
}