# Bash-ModFEM-Script
### Podstawy, żeby działało należy:
A. Zmodyfikować plik modfem_my_scripts/scripts/work_speed_up/imie_nazwiko_config i wpisać tam swoje "imie_nazwisko", które występuje w nazwach twoich plików ModFEM

B. Nadaj każdemu skryptowi prawo od wykonania ---> chmod +x make_modfem.sh    itd.

--- Wszytkie skrypty w katalogu modfem_my_scripts i copy_dat_jk.sh, create_folder.sh ---

-------------
### Część główna
1. Zamysł jest taki, że pobieracie sobie folder modfem_my_scripts i skrypty create_folder.sh, copy_dat_jk.sh na Honorate do folderu ~/ (root)

2. Jak tworzysz nowy folder to używasz skryptu ./create_folder.sh i automatycznie wszystkie potrzebne pliki są kopiowane

3. Wybierasz z jakiego pliku chcesz przekopiować pliki .dat i .jk. Pliki automatycznie kopiują się do tworzonego folderu

4. Wchodzisz do utworzonego folderu i masz wybór:

Wszystko co tutaj stworzyłem ma na celu przyśpieszenie pracy.
- make_modfem.sh ---> zamiast szukać po plikach odpalasz skrypt i kompilujesz
- manual_modfem_prism.sh ---> zamiast wpisywać długą ścieżkę odpalasz skrypt i działa
- modfem_prism_std.sh ---> jak odpalisz nano na skrypt to zobaczysz, że odpala on ModFEM w trybie wsadowym (z wykorzystaniem input_interactive.txt (który później jest usuwany, żeby nie przeszkadzał)). Sam możesz wybierać jaki opcje dla ModFEM wybierzesz modyfikując ten skrypt. Domyślnie działa tak, że 1 parametr określa ile razy zostanie wywołana adaptacje siatki przed rozwiązaniem "s". Skrypt tworzy lokalnie plik output_from_modfem.txt który zawierz wszystkie informacje który ModFEM normalnie wyświetla na ekranie
- analize.sh ---> prosty skrypt do wyciągnięcie tylko interesujących nas informacji z pliku output_from_modfem.txt. Można pozmieniać dodać grepy na aktualna zapotrzebowanie, tworzy plik analized_output.txt. Jest automatycznie wywoływany przez ./modfem_prism_std.sh

#######################################

Teraz kamień milowy pracy z ModFEM, wisienka na torcie.

-/work_speed_up/run_me.sh ---> wszystko co wcześniej tylko jeszcze lepiej i przyjemniej. Teraz jako 1 parametr podajemy liczbę adaptacji, do której ModFEM powoli dojdzie i na bieżąco pokaże dane oraz zapisze wersje oryginalną i przeanalizowaną do katalogu ~/DATA. ./run_me.sh 3 zacznie od 0, potem 1,2,3. Tak samo jak wcześniej jak najbardziej można modyfikować param_analize.sh i from_folder_to_one_big_folder_modfem_prism_std.sh na aktualne potrzeby. Jak na razie największe ułatwienie.

Chcesz dane do wykresów? 
1. Na wybranych plikach odpalasz ./run_me.sh
2. Wszystko czego potrzebujesz znajdziesz w folderze ~/DATA
3. Pobierasz cały folder na pulpit i rozkoszujesz się prostotą wykonanego zadania
