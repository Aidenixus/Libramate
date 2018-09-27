package object;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;



public class test {
	private roster r;
	
	public test(String path) throws FileNotFoundException
	{
		Gson g = new Gson();
		FileReader fr;
		BufferedReader br;
//		String jsonName = "Assignment3.json";
		fr = new FileReader(path);
		br = new BufferedReader(fr);
		r = g.fromJson(br, roster.class);

}
	public void save(String loc) throws IOException
	{
		Writer writer = new FileWriter(loc);
		Gson gson = new GsonBuilder().create();
		gson.toJson(r, writer);
		writer.flush();
	}

	public roster getR() {
		return r;
	}

	public void setR(roster r) {
		this.r = r;
	}}
