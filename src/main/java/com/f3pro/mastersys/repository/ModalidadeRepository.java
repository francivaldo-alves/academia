package com.f3pro.mastersys;

import com.f3pro.mastersys.domain.Aluno;
import com.f3pro.mastersys.domain.Modalidade;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ModalidadeRepository extends JpaRepository<Modalidade, Integer> {
}
