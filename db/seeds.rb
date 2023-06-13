puts "Cleaning the DB"
User.destroy_all
Game.destroy_all
Participation.destroy_all
Review.destroy_all
GameType.destroy_all
Chatroom.destroy_all
Message.destroy_all

puts "DB clean. Creating Game Type"

gt = GameType.new(
  name: "Tarot",
  rules: "Pour jouer au Tarot à 5, il vous faut :
  Le jeu de cartes de Tarot composé de 78 cartes.
  Être 5 joueurs.
  Comment jouer au tarot à 5 joueurs :
  La principale différence avec le tarot à 4 est que le tarot à 5 joueurs se joue en équipe. En effet, le preneur appelle un autre joueur à jouer avec lui. Cette équipe affrontera alors les 3 autres joueurs formant également une équipe. Ces équipes ne sont formées que le temps d’une partie.

  Le déroulement d’une partie de tarot à 5 joueurs :
  Lors de la distribution des cartes, le chien n’est plus composé de 6 cartes mais de 3 cartes. Lorsque l’un des joueurs décide de prendre, il doit avant que le chien ne soit retourné, appeler un roi. Celui qui possède le roi devient alors son partenaire pour la partie. A savoir que le joueur appelé doit gardé pour lui le fait qu’il soit avec le preneur jusqu’à bien entendu qu’il est posé le roi appelé.

  Dans le cas ou le preneur possède les 4 rois, il peut :

  S’appeler lui-même et donc jouer contre 4 joueurs
  Appeler à la place une dame.
  Si le preneur est le premier joueur à commencer, il n’a pas le droit de jouer la couleur du roi appelé.

  La partie se déroule ensuite avec les mêmes règles traditionnelles du tarot.

  Répartition des points au Tarot à 5 :
  Si l’équipe du preneur réussit son pari, le preneur prend les 2/3 des points et le joueur appelé 1/3. L’équipe adverse reçoit alors en négatif 1/3 chacun.  Dans le cas ou le pari n’est pas réussi, la répartition des points négatifs et positifs se fait de la même façon.

  Exemple :

  L’équipe du preneur réussit son pari a hauteur de 50 points.

  L’équipe défensive prend :

  Joueur 1 : -50 points (1/3 des points)
  Joueur 2 : -50 points (1/3 des points)
  Joueur 3 : -50 points (1/3 des points)
  L’équipe du preneur :

  Le preneur prend : +100 points ( 2/3 des points)
  Le joueur appelé : +50 points (1/3 des points)
  Dans le cas ou le preneur est tout seul, il prend en plus ou en moins tous les points."
)
gt.save!

gt = GameType.new(
  name: "Rami",
  rules: "Le Rami est un jeu de cartes de combinaison (c'est-à-dire que le but est de faire des combinaisons de cartes) pour deux joueurs et plus.
  Le Rami se joue avec deux jeux de 54 cartes classiques avec Jokers. L'ordre des cartes est As-2-3-4-5-6-7-8-9-10-Valet-Dame-Roi-As.
  L'as a ainsi une double valeur (avant le 2 et après le Roi).Le but d'une manche est d'être le premier à poser toutes les cartes de sa main sur la table.
  Le(s) perdant(s) d'une manche marquent un certain nombre de points. La finalité est de marquer le moins de points possible. Dans ClubDeJeux, les joueurs peuvent choisir à partir de quel nombre de points un joueur est éliminé de la table: 101, 201 ou 501 points.

  Distribution des cartes

  Le premier donneur est déterminé au hasard, puis chaque joueur distribuera les cartes alternativement à chaque manche, dans le sens des aiguilles d'une montre. Les deux jeux sont soigneusement mélangés ensemble pour ne former qu'un paquet. Ensuite le donneur distribue 14 cartes à chaque joueur, et enfin retourne la carte suivante pour former la première carte de la pile de défausse . Le reste des cartes constitue la pioche.C'est le joueur à la gauche du donneur qui commence.

  Tour de jeu

  Le joueur dont c'est le tour :

  Pioche la première carte de la pioche, ou alors la première carte de la défausse (sauf au premier tour) si elle lui permet de poser tout ou partie de son jeu (pour justifier cette prise), et dans ce cas doit être posée dans le tour courant.
  Peut poser tout ou partie de ses cartes, sous forme de combinaisons, sur la table.
  Peut poser une ou plusieurs de ses cartes sur son jeu déjà posé ou celui d'un autre joueur (seulement s'il a déjà posé).
  Peut échanger une de ses cartes un joker posé par la carte qu'il représente (seulement s'il a déjà posé).
  Enfin, il se défausse d'une carte de sa main et la place sur la pile de défausse face visible.


  Les combinaisons valides

  Les combinaisons qui peuvent être posées (voir plus loin pour la première pose) :

  Série de trois cartes de même valeur (brelan) ou de quatre cartes de même valeur (carré), mais de couleurs différentes.
  Séquence d'au moins trois cartes consécutives de même couleur.
  Attention Une suite contenant Roi-As-Deux est interdite. L'as mis en position de 1, restera un 1. L'As mis en position d'As (après le roi) restera un As.
  On peut mettre un joker pour remplacer n'importe quelle carte, mais un seul joker par combinaison. Ce joker est alors exactement équivalent à la carte qu'il remplace, et ne pourra être positionné qu'aux extrémités des séquences.

  Chaque joueur joue chacun à son tour, jusqu'à ce qu'un joueur ait posé ou défaussé sa dernière carte.
  Lorsque la pioche est vide, elle sera mélangée pour créer une nouvelle pioche.



  Évaluer une combinaison

  Chaque combinaison vaut un certain nombre de points. Ces points sont la somme des points attribués aux cartes qui la composent :

  Les cartes du 2 au 10 valent leur valeur (donc de 2 à 10 points).
  Le valet, la dame et le roi valent 10 points chacun.
  L'as vaut 1 s'il est dans une séquence suivi d'un 2 et d'un 3. Il vaut 11 s'il est dans une séquence suivant un roi et une dame, s'il est dans un brelan, ou s'il est dans un carré.
  Le joker vaut la valeur de la carte qu'il remplace.


  La première pose

  On ne peut poser qu'à partir du second tour. Pour poser la première fois chaque joueur doit poser un groupe de combinaisons ayant les caractéristiques suivantes :

  Contenir au moins 51 points
  Contenir au moins une tierce franche, c'est-à-dire une séquence de trois cartes sans joker.

  On peut bien sûr poser bien plus de 51 points. Une fois que l'on a posé, on n'est plus limité: on peut poser de nouveaux brelans, carrés, ou séquences, on peut compléter des combinaisons existantes chez soi ou chez un adversaire, et remplacer les jokers (voir la règle ci-après).


  Remplacer un joker

  On peut remplacer un joker posé chez soi ou un adversaire si on a déjà posé, à part un joker dans un brelan (mais pas de problème pour un carré).
  Il faut posséder la carte dont le joker a pris la place. On pose alors la carte à la place du joker et on prend le joker dans sa main.


  Fin de la manche

  La manche est finie quand un joueur n'a plus de cartes en main.
  Chaque joueur marque alors un nombre de points égal à la somme des points de ses cartes restants en main, selon les règles vues plus haut, sachant que :

  Un as, dans cette situation, vaut toujours 11
  Un joker (ou plusieurs), dans cette situation, double les points en main
  Quelqu'un qui n'a pas encore posé marque 100 points
  Si aucun joueur n'a encore posé et que quelqu'un ferme le jeu, les perdants marquent 200 points.

  Le but est bien évidemment de marquer le moins possible."
)
gt.save!

# To create an other GameType

# gt = GameType.new(
#   name: "",
#   rules: ""
# )
# gt.save!

puts "#{GameType.all.count} Game types created"

game = GameType.all.sample.id

u = User.new(
  email: "arnaud@wagon.org",
  password: "azerty",
  username: "CardMaster",
  first_name: "arnaud",
  last_name: "lejade",
  bio: "Freshly finished business school at ESCP with a specialization in Applied Data Science, and having experienced two jobs in entrepreneurship (Data Analyst and VC Analyst), I want to develop my coding skills and build a complete profile to find a job in Product in a startup !",
  tags: [1, 3],
  address: "19 Avenue de Villars, 75007 Paris",
  game_type_id: game,
  level: rand(1..5)
)

file = File.open(Rails.root.join("db/seeds/picture-arnaud.jpg"))
u.photo.attach(io: file, filename: "avatar.jpg")

u.save!

game = GameType.all.sample.id

u = User.new(
  email: "javier@wagon.org",
  password: "qwerty",
  username: "ElGuapo",
  first_name: "Javier",
  last_name: "Alvarez Salvado",
  bio: "¡Hola!
  I'm from Spain and I've been living in France since 2017.
  After coursing studies in communication, I've worked in MarCom positions for 6 years. I quit my last job looking for a change on my professional path.
  Coding has intrigued me since I first heard about it. So today, I'm looking forward to learn and improve web developing techniques.
  My main objective is to find new job opportunities in the tech.",
  tags: [0, 2],
  address: "20 Rue des Annelets, 75019 Paris",
  game_type_id: game,
  level: rand(1..5)
)

file = File.open(Rails.root.join("db/seeds/picture-javier.jpg"))
u.photo.attach(io: file, filename: "avatar.jpg")

u.save!

game = GameType.all.sample.id

u = User.new(
  email: "youval@wagon.org",
  password: "azerty",
  username: "MBappéOfCards",
  first_name: "Youval",
  last_name: "AKOUKA",
  bio: "Hello, I am Youval. I am a business app functional consultant, specialized in Microsoft solutions. I want to learn code to acquire new skills.",
  tags: [0, 1, 2, 3],
  address: "26 Rue de Constantinople, 75008 Paris",
  game_type_id: game,
  level: rand(1..5)
)

file = File.open(Rails.root.join("db/seeds/picture-youval.jpg"))
u.photo.attach(io: file, filename: "avatar.jpg")

u.save!

game = GameType.all.sample.id

u = User.new(
  email: "maxime@wagon.org",
  password: "azerty",
  username: "Albathar",
  first_name: "MAxime",
  last_name: "MoReIrA",
  bio: "Before being a Le Wagon's alumni, I was ergonomist in an occupational health service. I wanted to change to have more challenge and I tried to code when I was student (15 years ago) and don't understand why I stopped!",
  tags: [4, 5],
  address: "53 Rue Olivier de Serres, 75015 Paris",
  game_type_id: game,
  level: rand(1..5)
)

file = File.open(Rails.root.join("db/seeds/picture-maxime.jpg"))
u.photo.attach(io: file, filename: "avatar.jpg")

u.save!

game = GameType.all.sample.id

u = User.new(
  email: "helene@wagon.org",
  password: "azerty",
  username: "ShortestName",
  first_name: "Helene",
  last_name: "Becquembois",
  bio: "Shortest bio",
  tags: [0, 1, 2],
  address: "27 Rue Didot, 75014 Paris",
  game_type_id: game,
  level: rand(1..5)
)

file = File.open(Rails.root.join("db/seeds/picture-helene.jpg"))
u.photo.attach(io: file, filename: "avatar.jpg")

u.save!

game = GameType.all.sample.id

u = User.new(
  email: "tdm@wagon.org",
  password: "azerty",
  username: "TheLongestUsernameYouLlEverSeeInYourFuckingLife",
  first_name: "Thomas",
  last_name: "Pernety du Port du Mistral Gagnant",
  bio: "Lorem ipsum dolor sit amet. Aut galisum deserunt id molestiae voluptatibus aut nulla iste ut mollitia amet. Et nesciunt illo et pariatur impedit et recusandae suscipit sit veniam quasi eos quidem iusto. Et corporis assumenda hic itaque impedit et voluptatem quia et ullam obcaecati.

  Ea asperiores nostrum vel praesentium dicta rem voluptas voluptas ab quas nisi in nihil magnam ea nulla cupiditate aut voluptatem deserunt. Et tenetur provident id voluptatem blanditiis qui modi natus hic voluptas quasi qui voluptas velit et totam incidunt?",
  tags: [5],
  address: "162 bis Avenue du Général Michel Bizot, 75012 Paris",
  game_type_id: game,
  level: rand(1..5)
)

file = File.open(Rails.root.join("db/seeds/picture-thomas.jpg"))
u.photo.attach(io: file, filename: "avatar.jpg")

u.save!

# To create other users

# u = User.new(
#   email: "",
#   password: "",
#   username: "",
#   first_name: "",
#   last_name: "",
#   bio: "",
#   tags: [],
#   address: "",
#   game_type_id: game
# )
# u.save!

puts "#{User.all.count} users created. Creating games"


players = User.all.sample.id
stat = rand(0..2)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "River Café",
  location: "146 Quai de Stalingrad, 92130 Issy-les-Moulineaux",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "A real part of Tarot to find your real level",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..2)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Parc de Billancourt",
  location: "32 Allée Robert Doisneau, 92100 Boulogne-Billancourt",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "It's just a description because we have to add a description and it's boring",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..2)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Mother café",
  location: "103 Bd Jean Jaurès, 92100 Boulogne-Billancourt",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "Lorem ipsum dolor sit amet. Id sint rerum eos praesentium odio id consequatur temporibus ex fugiat quia qui aspernatur odit!",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..2)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Arc de Triomphe",
  location: "Place Charles de Gaulle, 75008 Paris",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "On risque de se faire bouger par les flics mais c'est le nouvel an alors on s'en fout on n'a qu'une vie",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..2)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Arc de Triomphe",
  location: "Place Charles de Gaulle, 75008 Paris",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "Lorem ipsum dolor sit amet. Ut fuga possimus quo illum fuga non enim esse. Ex dolor officiis qui velit asperiores aut repellat vero quo assumenda ipsa hic odit nobis qui pariatur iure ut nostrum eligendi.

  Rem mollitia accusamus ut amet nemo et tempora excepturi. Ab nostrum tempore eos exercitationem quod et voluptas possimus et nulla numquam et amet nostrum et aspernatur aperiam. Et veritatis voluptate ut iure corporis et internos possimus qui fugiat provident? Rem quia voluptas ea sint libero sit autem sint.",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..1)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Parc Monceau",
  location: "35 Boulevard de Courcelles, 75008 Paris",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "Sit voluptatem aspernatur 33 eligendi aspernatur et commodi laborum aut neque mollitia aut odit alias sed nihil quia non sequi amet. Ea mollitia fugit est error laborum et dolores animi.",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..1)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Mamma Primi",
  location: "18 Rue Boursault, 75017 Paris",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "Ut quisquam facere aut pariatur culpa quo corporis libero est asperiores quia. Id repellat voluptatem id asperiores ipsa et excepturi distinctio.",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..1)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Café des 2 moulins",
  location: "15 Rue Lepic, 75018 Paris",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "Aut laboriosam illum in voluptates consequuntur est harum aliquid est alias ducimus. Aut voluptatem illo et quis sint in repellat voluptatum ut cupiditate quam et quam blanditiis nam dolores mollitia.",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..1)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Cô my café",
  location: "21 Boulevard de Bonne Nouvelle, 75002 Paris",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "Non accusantium praesentium qui dolorum eaque 33 dolore Quis et consectetur eaque.",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..1)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Holybelly",
  location: "5 Rue Lucien Sampaix, 75010 Paris",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "accusantium non consequatur ducimus et voluptatibus",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..1)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Jardin Villemin",
  location: "14 Rue des Récollets, 75010 Paris",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "Non assumenda accusantium non consequatur ducimus et voluptatibus quia aut nostrum vero qui aliquid illo ab quis officiis.",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..1)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Le Train Bleu, Paris Gare de Lyon",
  location: "Place Louis-Armand hall 1, 75012 Paris",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "Et nihil aliquam qui sint sunt est beatae vero qui explicabo nobis ut officia eligendi non beatae quos.",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..1)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Parc Zoologique de Paris",
  location: "Avenue Daumesnil, 75012 Paris",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "Ut voluptatibus voluptatem est dolor vero ea corporis autem et harum quis.",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..1)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Jardin des Plantes",
  location: "57 Rue Cuvier, 75005 Paris",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "Est enim voluptas non tenetur quaerat est quia earum non reprehenderit culpa. Est nobis placeat non rerum sunt vel deleniti neque et atque nihil qui aliquid aspernatur rem quas sunt qui autem perspiciatis",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..1)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Bibliothèque George Brassens",
  location: "38 Rue Gassendi, 75014 Paris",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "Et molestiae dolore quo dolores tempore et perspiciatis nemo aut laudantium quibusdam et harum error aut excepturi error ut esse velit. Qui neque necessitatibus non reiciendis molestiae ad nihil corporis quo blanditiis accusamus.",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

players = User.all.sample.id
stat = rand(0..1)
number = rand(3..5)
time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
compet = [true, false].sample
game = GameType.all.sample.id

g = Game.new(
  place: "Champ de Mars",
  location: "2 Allée Adrienne Lecouvreur, 75007 Paris",
  duration: long,
  start_at: time,
  number_of_players: number,
  competitive: compet,
  description: "Eos dignissimos impedit et culpa autem quo quia vitae et cupiditate placeat At velit nobis sed repellendus consequatur ab tempore totam.",
  status: stat,
  user_id: players,
  game_type_id: game
)
g.save!

# To create an other game

# players = User.all.sample.id
# stat = rand(0..1)
# number = rand(3..5)
# time = DateTime.new(2023, 12, 30, 20, 45) - rand(1).years - rand(11).months - rand(29).days - rand(20).hours
# long = [30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180].sample
# compet = [true, false].sample
# game = GameType.all.sample.id

# g = Game.new(
#   place: "",
#   location: "",
#   duration: long,
#   start_at: time,
#   number_of_players: number,
#   competitive: compet,
#   description: "",
#   status: stat,
#   user_id: players,
#   game_type_id: game
# )
# g.save!

puts "#{Game.all.count} games created. Creating participations"

Game.all.each do |game|
  users = [game.user]

  game.participations.first.update(score: -1000.step(1000, 10).to_a.sample)

  (2..game.number_of_players).each do |i|
    user = User.where.not(id: users.map(&:id)).sample

    users << user
    if i != (game.number_of_players)
      score = -1000.step(1000, 10).to_a.sample
    else
      score = game.participations.sum(:score) * (-1)
    end
    Participation.create!(
      status: 1,
      score: score,
      game_id: game.id,
      user_id: user.id
    )
  end
end

puts "#{Participation.count} participations created. Creating reviews"

Game.all.each do |game|
  users = []
  number_of_reviews = (game.number_of_players) * (game.number_of_players - 1)

  game.users.each do |user|
    game.users.where.not(id: user.id).each do |other_user|
      Review.create!(
        personality_rating: [true, false].sample,
        participation: Participation.find_by(game: game, user: user),
        user: other_user
      )
    end
  end
end

puts "#{Review.count} reviews"


# Custom game with slots available
g = Game.new(
  location: "Champ de Mars, 2 Allée Adrienne Lecouvreur, 75007 Paris",
  duration: long,
  start_at: (Date.today + 3.weeks),
  number_of_players: 5,
  competitive: compet,
  description: "Eos dignissimos impedit et culpa autem quo quia vitae et cupiditate placeat At velit nobis sed repellendus consequatur ab tempore totam.",
  status: 1,
  game_type_id: game
)
g.user = User.third
g.save!

p = Participation.new(
  status: 1,
  game_id: g.id,
  score: 0
)
p.user = User.second
p.save!

p = Participation.new(
  status: 1,
  game_id: g.id,
  score: 0,
  user_id: User.last
)
p.user = User.last
p.save!
