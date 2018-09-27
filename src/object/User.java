package object;

import java.util.List;


public class User {
	private String username;
	private String password;
	private String imageURL;
	private List<String> followers;
	private List<String> following;
	private Library library;
	public User(String u, String p, String im, List<String> foer,
			List<String> foing, List<String> re, List<String> fa)
	{
		username = u;
		password = p;
		imageURL = im;
		followers= foer;
		following = foing;
		library = new Library(re,fa);
	}
	
	public String getUsername()
	{
		return username;
	}
	public String getPassword()
	{
		return password;
	}
	public String getImageURL()
	{
		return imageURL;
	}
	public List<String> getFollowers()
	{
		return followers;
	}
	public List<String> getFollowing()
	{
		return following;
	}
	public Library getLibrary()
	{
		return library;
	}
	public void addFollower(String follower)
	{
		int check = 0;
		for (int i = 0; i < followers.size();i++)
		{
			if (followers.get(i).equals(follower))
			{
				check++;
			}
		}
		if (check==0)
		{
		followers.add(follower);
		}
	}
	public void removeFollower(String follower)
	{
		followers.remove(follower);
	}
	public void addFollowing(String followings)
	{
		int check = 0;
		for (int i = 0; i < following.size();i++)
		{
			if (following.get(i).equals(followings))
			{
				check++;
			}
		}
		if (check==0)
		{
			following.add(followings);
		}
	}
	public void removeFollowing(String followings)
	{
		following.remove(followings);
	}
	public void addRead(String read)
	{
		int check = 0;
		for (int i = 0; i < library.getReading().size();i++)
		{
			if (library.getReading().get(i).equals(read))
			{
				check++;
			}
		}
		if (check == 0)
		{
			library.addRead(read);
		}
	}
	public void addFavorite(String fav)
	{
		int check = 0;
		for (int i = 0; i < library.getFavorite().size();i++)
		{
			if (library.getFavorite().get(i).equals(fav))
			{
				check++;
			}
		}
		if (check == 0)
		{
			library.addFav(fav);
		}
	}
}

