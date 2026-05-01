package com.f3pro.mastersys;

import com.f3pro.mastersys.domain.Aluno;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlunoRepository  extends JpaRepository<Aluno, Integer> {
}
