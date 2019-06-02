class AddCourseAndTags < SeedMigration::Migration
  COURSES = [
    {
        "course_name" => "Matemática",
        "area" => "Ciências Exatas",
        "subjects" => [
            "Álgebra",
            "Análise",
            "Cálculo",
            "Geomática",
            "Estatística",
            "Geometria",
            "Teoria da informação",
            "Teoria dos jogos",
            "Teoria dos números",
            "Teoria da probabilidade",
            "Topologia"
        ]
    },
    {
        "course_name" => "Computação",
        "area" => "Ciências Exatas",
        "subjects" => [
            "Algoritmos",
            "Arquitetura de Computadores",
            "Banco de Dados",
            "Computação Gráfica",
            "Engenharia de Software",
            "Gerenciamento de Projetos de Software",
            "Inteligência Artificial",
            "Interação humano-computador",
            "Linguagens de Programação",
            "Mecatrônica",
            "Programação",
            "Redes",
            "Robótica",
            "Sistemas de Informação",
            "Sistemas Operacionais",
            "Teoria da Computação"
        ]
    },
    {
        "course_name" => "Economia",
        "area" => "Ciências Humanas",
        "subjects" => [
            "Econometria",
            "Macroeconomia",
            "Microeconomia",
            "História econômica",
            "História do pensamento econômico"
        ]
    },
    {
        "course_name" => "Filosofia",
        "area" => "Ciências Humanas",
        "subjects" => [
            "Augustinologia",
            "Axiologia",
            "Cristologia",
            "Demonologia",
            "Eclesiologia",
            "Epistemologia",
            "Escatologia",
            "Ética",
            "Filosofia da Religião",
            "Filosofia Política",
            "Estética e Filosofia da Arte",
            "Filosofia da Ciência",
            "Filosofia da Mente",
            "Filosofia da Linguagem",
            "Gnosiologia",
            "Hagiologia",
            "Heresiologia",
            "Hierografologia",
            "Hierologia",
            "Lógica",
            "Mariologia",
            "Metafísica",
            "Missiologia",
            "Neuroteologia",
            "Soteriologia"
        ]
    },
    {
        "course_name" => "Direito",
        "area" => "Ciências Sociais Aplicadas",
        "subjects" => [
            "Ciência Política",
            "Direito Administrativo",
            "Direito Aduaneiro",
            "Direito Aéreo",
            "Direito Agrário",
            "Direito Ambiental",
            "Direito Civil"
        ]
    },
    {
        "course_name" => "Administração",
        "area" => "Ciências Sociais Aplicadas",
        "subjects" => [
            "Auditoria",
            "Perícia",
            "Controladoria",
            "Contabilidade"
        ]
    },
    {
        "course_name" => "Arquitetura",
        "area" => "Artes",
        "subjects" => [
            "Projeto de arquitetura",
            "Projeto paisagístico",
            "Desenho urbano",
            "Arquitectura de Interiores",
            "Desenho arquitetônico",
            "História da Arquitetura",
            "História do Urbanismo",
            "História das cidades",
            "Linguagem arquitetônica",
            "Design"
        ]
    },
    {
        "course_name" => "Arquitetura",
        "area" => "Química",
        "subjects" => [
            "Alquimia",
            "Agroquímica",
            "Astroquímica",
            "Bioquímica",
            "Cosmoquímica",
            "Eletroquímica",
            "Engenharia química",
            "Espectroscopia",
            "Femtoquímica",
            "Físico-química",
            "Geoquímica",
            "Mineralogia",
            "Processos industriais",
            "Química ambiental",
            "Química analítica",
            "Química atmosférica",
            "Química bioinorgânica",
            "Química computacional",
            "Química fisiológica",
            "Química inorgânica",
            "Química orgânica",
            "Química verde",
            "Quimioinformática",
            "Quimiometria"
        ]
    },
    {
        "course_name" => "Medicina",
        "area" => "Ciências da Saúde",
        "subjects" => [
            "Farmacognosia",
            "Fitoquímica",
            "Farmacologia",
            "Farmacocinética",
            "Farmacodinâmica",
            "Farmacotécnica",
            "Farmacoterapêutica",
            "Homeopatia",
            "Farmácia hospitalar",
            "Cardiologia",
            "Coloproctologia",
            "Dermatologia",
            "Medicina legal",
            "Neurociência",
            "Oftalmologia",
            "Pneumologia",
            "Sexologia",
            "Urologia",
            "Cirurgia e traumatologia bucomaxilofacial",
            "Dentística",
            "Disfunção temporomandibular e dor orofacial",
            "Endodontia",
            "Implantodontia",
            "Oclusão",
            "Odontologia do trabalho",
            "Odontopediatria",
            "Odontogeriatria",
            "Odontologia legal",
            "Ortodontia e ortopedia facial",
            "Ortopedia funcional",
            "Periodontia",
            "Psicologia"
        ]
    }
  ]

  def up
    COURSES.each do |c|
      course = Course.create!(
          name: c["course_name"],
          area: c["area"]
      )
  
      c["subjects"].each do |tag|
        tag_obj = Tag.where(name: c["area"]).last

        unless tag_obj
          tag_obj = Tag.create!(
              name: tag,  
              parent: c["area"]
          )
        end

        course.tags << tag_obj
      end
    end
  end

  def down
    COURSES .each do |course|
      Course.where(name: course["course_name"]).destroy_all
    end
  end
end
