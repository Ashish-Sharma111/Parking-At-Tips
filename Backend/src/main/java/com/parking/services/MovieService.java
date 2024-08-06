package com.parking.services;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.parking.dtos.MovieDTO;
import com.parking.models.Movie;
import com.parking.repos.MovieRepository;
import com.parking.utils.StorageService;

@Service
public class MovieService {

	@Autowired private MovieRepository repo;
	@Autowired private StorageService storage;
	
	public void save(Movie movie,MultipartFile photo) {
		System.out.println("movie id"+movie.getMovieId());
		if(movie.getMovieId()==0) {
			String poster=storage.store(photo);
			movie.setPoster(poster);
		}else {
			if(photo!=null) {
				String poster=storage.store(photo);
				movie.setPoster(poster);				
			}else {
				Movie mm=repo.findById(movie.getMovieId()).get();
				movie.setPoster(mm.getPoster());
			}
		}
		repo.save(movie);
	}
	
	public List<Movie> listall(){
		return repo.findAll();
	}
	
	public Movie findById(int id) {
		return repo.getById(id);
	}
	
	public void deleteMovie(int id) {
		repo.delete(repo.getById(id));
	}
}
