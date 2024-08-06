package com.parking.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.parking.models.Hall;

@Repository
public interface HallRepository extends JpaRepository<Hall, Integer> {

}
