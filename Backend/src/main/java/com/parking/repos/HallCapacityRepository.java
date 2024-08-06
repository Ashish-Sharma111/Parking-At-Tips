package com.parking.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.parking.models.Hall;
import com.parking.models.HallCapacity;

@Repository
public interface HallCapacityRepository extends JpaRepository<HallCapacity, Integer> {
	
	List<HallCapacity> findByHall(Hall hall);

}
