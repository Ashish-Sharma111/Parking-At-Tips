package com.parking.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.parking.models.Movie;

@Repository
public interface MovieRepository extends JpaRepository<Movie, Integer>{

}
