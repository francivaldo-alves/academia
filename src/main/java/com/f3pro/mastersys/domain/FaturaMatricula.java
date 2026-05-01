package com.f3pro.mastersys.domain;

import com.f3pro.mastersys.domain.enums.StatusFatura;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "faturas_matriculas")
public class FaturaMatricula {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "data_vencimento")
    private LocalDate dataVencimento;

    private BigDecimal valor;

    @Column(name = "data_pagamento")
    private LocalDate dataPagamento;

    @Column(name = "data_cancelamento")
    private LocalDate dataCancelamento;

    private StatusFatura EstatusFatura = StatusFatura.ABERTA;

    @ManyToOne(fetch = FetchType.LAZY)
    @Column(name = "matricula_id")
    private Matricula matricula;

}
