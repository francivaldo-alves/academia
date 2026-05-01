package com.f3pro.mastersys;

import com.f3pro.mastersys.domain.enums.Assiduidade;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AssiduidadeRepository extends JpaRepository<Assiduidade, Integer> {
}
