package reqfiles;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;

public class LDAP
      {
            static String ATTRIBUTE_FOR_USER = "sAMAccountName";
            public Attributes authenticateUser(String username, String password, String _domain, String host, String dn)
            {

                  String returnedAtts[] ={ "sn", "givenName", "mail" };
                  String searchFilter = "(&(objectClass=user)(" + ATTRIBUTE_FOR_USER + "=" + username + "))";
                  //Create the search controls

                  SearchControls searchCtls = new SearchControls();
                  searchCtls.setReturningAttributes(returnedAtts);
                  //Specify the search scope

                  searchCtls.setSearchScope(SearchControls.SUBTREE_SCOPE);
                  String searchBase = dn;
                  Hashtable environment = new Hashtable();
                  environment.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
                  //Using starndard Port, check your instalation

                  environment.put(Context.PROVIDER_URL, "ldap://" + host + ":389");
                  environment.put(Context.SECURITY_AUTHENTICATION, "simple");

                  environment.put(Context.SECURITY_PRINCIPAL, username + "@" + _domain);
                  environment.put(Context.SECURITY_CREDENTIALS, password);
                  LdapContext ctxGC = null;
                  try
                  {
                        ctxGC = new InitialLdapContext(environment, null);
                        //    Search for objects in the GC using the filter

                        NamingEnumeration answer = ctxGC.search(searchBase, searchFilter, searchCtls);
                        while (answer.hasMoreElements())
                        {
                              SearchResult sr = (SearchResult)answer.next();
                              Attributes attrs = sr.getAttributes();
                              if (attrs != null)
                              {
                                    return attrs;
                              }
                        }

                   }
                  catch (NamingException e)
                  {
                        System.out.println("Just reporting error");
                  }
                  return null;
            }
     }

      


