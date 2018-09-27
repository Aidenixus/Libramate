package object;


import java.util.List;

public class Library {
	private List<String> read;
	private List<String> favorite;
	public Library() {
		
	}
	public Library(List<String> re, List<String> fa)
	{
		read = re;
		favorite = fa;
	}
	public List<String> getReading()
	{
		return read;
	}
	public List<String> getFavorite()
	{
		return favorite;
	}
	public void addRead(String read)
	{
		this.read.add(read);
	}
	public void addFav(String fav)
	{
		this.favorite.add(fav);
	}
}
