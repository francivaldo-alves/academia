package com.f3pro.mastersys;

import com.f3pro.mastersys.domain.Aluno;
import com.f3pro.mastersys.domain.FaturaMatricula;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FaturaMatriculaRepository extends JpaRepository<FaturaMatricula, Integer> {
}
