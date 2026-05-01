package com.f3pro.mastersys.domain.enums;

import com.f3pro.mastersys.domain.Matricula;
import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "assiduidade")
public class Assiduidade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "data_entrada")
    private LocalDateTime dataEntrada;

    @Column(name = "data_saida")
    private LocalDateTime dataSaida;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "matricula_id")
    private Matricula matricula;

    @PrePersist
    public void prePersist() {
        if (dataEntrada == null) {
            dataEntrada = LocalDateTime.now();
        }


    }


}
