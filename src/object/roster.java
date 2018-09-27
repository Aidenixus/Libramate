package object;

	import java.util.ArrayList;
import java.util.List;


	public class roster {
		private List<User> users = new ArrayList<User>();
		public List<User> getUsers()
		{
			return users;
		}
		public void setUsers(List<User> s)
		{
			this.users = s;
		}
		public void addUser(User s)
		{
			users.add(s);
		}
		public void removeUser(int index)
		{
			users.remove(index);
		}
		public int getSize()
		{
			return users.size();
		}
		public User getUserByNum(int i)
		{
			return users.get(i);
		}
		public void update(User newUser)
		{
			for (int i = 0; i < users.size(); i++)
			{
				if (getUserByNum(i).getUsername().equals(newUser.getUsername()))
				{
					users.remove(i);
					users.add(newUser);
					break;
				}
			}
		}
		public User getUserByUsername(String username)
		{
			for (int i = 0; i < users.size(); i++)
			{
				if (getUserByNum(i).getUsername().equals(username))
				{
					return getUserByNum(i);
				}
			}
			return null;
		}
		public User getUserByLink(String link)
		{
			for (int i = 0; i < users.size(); i++)
			{
				if (getUserByNum(i).getImageURL().equals(link))
				{
					return getUserByNum(i);
				}
			}
			return null;
		}
		
		public List<User> search(String sub)
		{
			List<User> userfound = new ArrayList<User>();
			for (int i = 0; i < users.size();i++)
			{
				if (getUserByNum(i).getUsername().contains(sub))
				{
					userfound.add(getUserByNum(i));
				}
			}
			return userfound;
		}
		
		public int VerifyE(String username)
		{
			int check = 0;
			for (int i = 0; i < users.size();i++)
			{
				if (username.equals(getUserByNum(i).getUsername()))
				{
					check =1;
					break;
				}
			}
			if (check == 1)
			{
				return 1;
			}
			else
			{
				return 0;
			}
				
		}
		public int Verify(String username, String pw)
		{
			int check = 0;
			int index = 0;
			for (int i = 0; i < users.size();i++)
			{
				if (username.equals(getUserByNum(i).getUsername()))
				{
					index = i;
					check =1;
					break;
				}
			}
			if (check == 0)
			{
				return 0;
			}
			User user = getUserByNum(index);
			if (user.getPassword().equals(pw))
			{
				return 1;
			}
			else
			{
				return 0;
			}
			
		}
		public User Return(String username)
		{
			for (int i = 0; i < users.size(); i++)
			{
				if (username.equals(getUserByNum(i).getUsername()))
				{
					return getUserByNum(i);
				}
			}
		return null;
	}
	}
