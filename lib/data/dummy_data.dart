import 'package:flutter/material.dart';

import '../models/category.dart';

// ignore: unnecessary_const, constant_identifier_names
//const Color color = Color.fromARGB(255, 0, 185, 132); Tema Verde
const Color color = Color.fromARGB(255, 0, 134, 255); //Tema Azul
const DUMMY_CATEGORIES = [
  Category(
    id: 'c1',
    title: 'Alunos',
    icone: Icon(
      Icons.people,
      color: color,
    ),
  ),
  Category(
    id: 'c2',
    title: 'Pagamentos',
    icone: Icon(
      Icons.monetization_on,
      color: color,
    ),
  ),
  Category(
    id: 'c3',
    title: 'Treinos',
    icone: Icon(
      Icons.monitor_heart_rounded,
      color: color,
    ),
  ),
  Category(
    id: 'c4',
    title: 'Frequência',
    icone: Icon(
      Icons.checklist_outlined,
      color: color,
    ),
  ),
  Category(
    id: 'c5',
    title: 'Feed',
    icone: Icon(
      Icons.feed_outlined,
      color: color,
    ),
  ),
  Category(
    id: 'c6',
    title: 'Perimetrias',
    icone: Icon(
      Icons.date_range_rounded,
      color: color,
    ),
  ),
];

  
//   final DUMMY_ALUNOS = [
//   Aluno(
//       id: "0",
//       nomeCompleto: 'Cleiton Alencar',
//       dataNascimento: '23/12/1997',
//       telefone: '8899999999',
//       endereco: 'Rua A',
//       patologia: 'Nenhuma',
//       objetivo: 'Hipertrofia',
//       acompanhamentoNutricional: "Não",
//       status: true),
//   Aluno(
//       id: "1",
//       nomeCompleto: 'Vitória Glenda',
//       dataNascimento: '24/03/2001',
//       telefone: '8899123456',
//       endereco: 'Rua C',
//       patologia: 'Nenhuma',
//       objetivo: 'Perda de peso',
//       acompanhamentoNutricional: "Não",
//       status: true),
//   Aluno(
//       id: "2",
//       nomeCompleto: 'Fulano de tal',
//       dataNascimento: '01/06/2006',
//       telefone: '8898765432',
//       endereco: 'Rua C',
//       patologia: 'Nenhuma',
//       objetivo: 'Powerlifting',
//       acompanhamentoNutricional: "Não",
//       status: true)
// ];
