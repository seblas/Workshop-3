<p>
Program <b>Workshop3</b> jest rozszerzeniem <b>Workshop2</b>, gdzie mieliśmy tylko klasy <b>User</b> i <b>UserDao</b>. <b>UserDao</b> była klasą działającą
 na obiektach <b>User</b> z wykorzystaniem bazy danych.<br>
    Oba projekty utworzone zostały w celu nauki programowania JAVA.<br>
        <b>Workshop3</b> dodaje możliwość przystepnej obsługi <b>Workshop2</b>, gdyż udostepnia panel HTML, gdzie można:
<br>
<ul>
    <li>wyświetlić listę użytkowników (servlet <b>UserList</b>)</li>
    <li>dodać kolejnego użytkownika (<b>Add</b>)</li>
    <li>wyedytować użytkownika (<b>Edit</b>)</li>
    <li>usunąć użytkownika (<b>Delete</b>)</li>
    <li>pokazać pojedynczego użytkownika (<b>Show</b>)</li>
</ul>
</p>
<p>
    Do wersji opisanej w zadaniu zostały dodane ulepszenia:
    <ol>
    <li>Podczas dodawania i edytowania użytkownika sprawdzana jest poprawność wpisanego adresu email.
    Program też sprawdza czy podane dwukrotnie hasło jest takie samo i czy nie wpisano
        dwukrotnie puste hasło. Dodatkowo wprowadzono możliwość podglądu
    wpisanego hasła (link "Pokaż hasła"). Wszystkie te udogodnienia zostały zrobione w technologii javascript.
        </li>
    <li>
    Kolejnym ulepszeniem jest wyświetlenie komunikatu, jeżeli wprowadzony adres mailowy istnieje już w bazie danych.
        Standardowo MySQL nie dodał by takiego użytkownika, ale osoba obsługująca panel nie wiedziałaby, że
        użytkownik nie został dodany. Sprawdzaniem adresu mailowego zajmuje się servlet. Na potrzeby tej funkcjonalności
        musiała zostać utworzona dodatkowa metoda w klasie UserDao (szukanie w bazie po adresie mailowym).
        Mozna było zostać przy standardowej wersji UserDao, ale działanie programu byłoby wolniejsze, gdyż system
        musiałby ściągać wszystkie rekordy i dopiero wówczas szukać adresu mailowego.
    </li>
    <li>
        Wprowadzono zabezpieczenie przed przypadkowym usunięciem użytkownika z poziomu listy użytkowników.
        Przed usunięciem pokazuje się komunikat proszący o potwierdzenie wykonania usunięcia.
    </li>
</ol>
</p>