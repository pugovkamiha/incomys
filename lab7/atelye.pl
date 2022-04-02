atelye:-
    consult("prices.pl"),
    consult("materials.pl"),
    consult("furniturs.pl"),
    atelye_menu. 

atelye_menu:-
    nl,
    writeln("Menu"),
    writeln("1 - Price rabot"),
    writeln("2 - Price materialov"),
    writeln("3 - Price furnitur"),
    writeln("4 - Pokupka"),
    nl,
    punkt.

punkt:-
    write("Vvedite nomer punkta: "),
    readln(N),
    convert_to_number(N, R),
    search(R),
    nl,
    writeln("najmite lyubuyu knopku dlya vihoda v glavnoe menu"),
    readln(A),
    exit(A).

search(N):- 
    N = 1, !, 
    show_price.
search(N):- 
    N = 2, !, 
    show_material.
search(N):- 
    N = 3, !, 
    show_furnitur.
search(N):-
    N = 4, !, 
    buy.
search(_):- punkt.

exit(_):- atelye_menu.

buy:-
    furnitur_buy_many(N3, P3, T3),
    price_buy(N1, P1, T1),
    material_buy(N2, P2, T2),
    age(A),
    cart(N3, N2, N1),
    X1 is P1 + P2 + P3,
    X is round(X1 * A),
    Y is 8 * T1,
    N is Y + T3,
    M is round(N * T2),
    write("Full price: "),
    writeln(X),
    write("Vremya raboti v chasah: "),
    writeln(M),
    write("Vremya raboti v dnyah: "),
    D is M / 8,
    writeln(D).

cart(N3, N2, N1):-
    writeln("Vash zakaz: "),
    write("Odejda: "),
    writeln(N1),
    write("Material: "),
    writeln(N2),
    write("Furnitura: "),
    show_N3(N3),
    nl.

age(I):-
    nl,
    writeln("1 - detskaya"),
    writeln("2 - vzroslaya"),
    nl,
    vvod(X),
    check_age(X, I).

check_age(X, 0.7):- X = 1, !.
check_age(_, 1).

price_buy(N, P, T):-
    show_price,
    vvod(I),
    find_price(I, N, P, T).

material_buy(N, P, T):-
    show_material,
    vvod(I),
    find_material(I, N, P, T).

furnitur_buy_many(N, P, T):-
    buyes_furniturs(N, P, T).

buyes_furniturs([N | Tail], P1, T1):-
    furnitur_buy(N, P, T),
    more(A),
    A = 1,
    !,
    buyes_furniturs(Tail, P2, T2),
    P1 is P2 + P,
    T1 is T2 + T.
buyes_furniturs([], 0, 0).

more(A):-
    nl,
    writeln("Kupit eshe furnituri (1 - da / 0 - net)?"),
    readln(O),
    convert_to_number(O, N),
    exit(N, A).

exit(N, N):-
    (N = 1 ; N = 0), !.
exit(_, 0).

furnitur_buy(N, P, T):-
    show_furnitur,
    vvod(I),
    find_furnitur(I, N, P, T).

vvod(I):-
    nl,
    write("Vvedite id: "),
    readln(M),
    nl,
    convert_to_number(M, I).
find_price(I, N, P, T):-
    price(I, N, P, T).

find_material(I, N, P, T):-
    material(I, N, P, T).

find_furnitur(I, N, P, T):-
    furnitur(I, N, P, T).

show_price:-
    findall(Z, prices(Z), S),
    writeln("id, Odejda - Cena"),
    show_all(S).

prices([I, N, P, T]):-
    price(I, N, P, T).

show_all([]):- !.
show_all([[H, H1, H2, _ | _] | T]):-
    write(H),
    write(", "),
    write(H1),
    write(" - "),
    write(H2),
    nl,
    show_all(T).

show_N3([]):-!.
show_N3([H | T]):-
    write(H),
    write(", "),
    show_N3(T).

show_material:-
    findall(Z, materials(Z), S),
    writeln("id, Material - Cena"),
    show_all(S).

materials([I, N, P, T]):-
    material(I, N, P, T).

show_furnitur:-
    findall(Z, furniturs(Z), S),
    writeln("id, Furnitura - Cena"),
    show_all(S).

furniturs([I, N, P, T]):-
    furnitur(I, N, P, T).


convert_to_number([A | _], A).

:-atelye.