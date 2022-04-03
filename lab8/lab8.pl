% подбор компьютера

rule(1, "компьютер", "игровой", [1]).
rule(2, "компьютер", "игровой", [2]).
rule(3, "компьютер", "недорогой", [3]).
rule(4, "ноутбук", "не большой", [4]).
rule(5, "ноутбук", "игровой", [5, 6]).
rule(6, "компьютер", "серверный", [7]).
rule(7, "ноутбук", "не большой", [8, 9]).
rule(8, "компьютер", "недорогой", [10, 11]).
rule(9, "компьютер", "б/у", [12]).
rule(10, "ноутбук", "б/у", [13]).
rule(11, "компьютер", "с быстрым процессором", [14]).
rule(12, "компьютер", "с мощной видеокартой", [15]).
rule(13, "телефон", "не дешевый", [16]).
rule(14, "телефон", "любой", [17]).
rule(15, "компьютер", "не дорогой", [18]).
rule(15, "ноубтук", "не дорогой", [19]).
rule(16, "MSI", "Vector GP66", [20]).
rule(17, "APPLE", "macbook", [21]).
rule(18, "APPLE", "IMac", [22]).
rule(19, "Lenovo", "IdeaPad 1", [23]).
rule(20, "Acer", "TravelMate ", [24]).
rule(21, "ASUS ", "ExpertBook B1", [25]).
rule(22, "ноутбук", "не подлежащий ремонту", [26]).
rule(23, "macbook", "не подлежащий ремонту", [27]).
rule(24, "Lenovo", "Ideapad 3 17ITL6", [28]).
rule(25, "компьютер", "любой", [29]).
rule(26, "компьютер", "не mac", [30]).
rule(27, "ноутбук", "не macbook", [31]).
rule(28, "компьютер", "на archlinux", [32]).
rule(29, "ноутбук", "на archlinux", [33]).
rule(30, "компьютер", "на freeBSD", [34]).

ask(X):- fact(X, "да"),!.
ask(X):- fact(X, "нет"),!,fail.
ask(1):- write("нужен для игр?"),!,complete(1).
ask(2):- write("нужен для фотомонтажа?"),!,complete(2).
ask(3):- write("нужен для ворда?"),!,complete(3).
ask(4):- write("нужен в поездках?"),!,complete(4).
ask(5):- write("нужен в поездках для игр?"),!,complete(5).
ask(6):- write("нужен для программирования игр?"),!,complete(6).
ask(7):- write("нужен для серверов?"),!,complete(7).
ask(8):- write("нужен для теста машины?"),!,complete(8).
ask(9):- write("нужен для рабоыт в кафе?"),!,complete(9).
ask(10):- write("нужен для бухгалтера?"),!,complete(10).
ask(11):- write("нужен для приема заказов?"),!,complete(11).
ask(12):- write("мало денег, а в игры хочется играть?"),!,complete(12).
ask(13):- write("мало денег, а в игры хочется играть, так еще часто брать куда-то?"),!,complete(13).
ask(14):- write("нужен для стриминга игр?"),!,complete(14).
ask(15):- write("нужен для стриминга новинок игр?"),!,complete(15).
ask(16):- write("нужно стримить на улице?"),!,complete(16).
ask(17):- write("нужно играть в brawl stars?"),!,complete(17).
ask(18):- write("нужен бабушке для новостей?"),!,complete(18).
ask(19):- write("нужен бабушке для одноклассников дома и на даче?"),!,complete(19).
ask(20):- write("нужен для всего и везде?"),!,complete(20).
ask(21):- write("игры не нужны, но нужна красота и портативность?"),!,complete(21).
ask(22):- write("игры не нужны, но нужна красота?"),!,complete(22).
ask(23):- write("нужен на linux?"),!,complete(23).
ask(24):- write("нужен на windows 11?"),!,complete(24).
ask(25):- write("нужен на windows 10?"),!,complete(25).
ask(26):- write("хотите его разбить?"),!,complete(26).
ask(27):- write("хотите его, чтобы все были в шоке?"),!,complete(27).
ask(28):- write("нужен с большой диагональю?"),!,complete(28).
ask(29):- write("хотите потом апгрейдить?"),!,complete(29).
ask(30):- write("вам обязательно нужен апгрейд?"),!,complete(30).
ask(31):- write("нужен переносной и без слежки?"),!,complete(31).
ask(32):- write("вы паранойк?"),!,complete(32).
ask(33):- write("вы паранойк и часто ездите?"),!,complete(33).
ask(34):- write("хотите, чтобы никто не узнал какие данные у вас?"),!,complete(34).


recognition(X):- rule(N, X, Y, Z), discover(Z), !,
write("------"), write(X), write(" - "), write(Y), write(" по правилу "), write(N), nl,
recognition(Y).
recognition("ноутбук"):- write("не удалось подобрать вам ноутбук"),!.
recognition("игровой"):- write("вам подойдет игровой компьютер"),!.
recognition(_).
discover([]).
discover([X|Y]):- ask(X), discover(Y).
complete(X):- nl, read(Y), assert(fact(X, Y)), Y="да".
