# Bash-ModFEM-Script

!!! Żeby w ogóle mogło zadziałać musisz zmodyfikować pliki:
-scripts/make_modfem.sh
-scripts/modfem_prism_std.sh
-scripts/manual_modfem_prism.sh
-scripts/work_speed_up/from_folder_to_one_big_folder_modfem_prism_std.sh

na górze każdego z tych plików zmień na swoje imie_nazwiko

!!! Najprawdopodobniej będzie trzeba dodać każdemu skryptowi prawo od wykonania
chmod +x make_modfem.sh
itd.

1. Zamysł jest taki, że pobieracie sobie folder modfem_my_scripts i skrypt create_folder.sh na Honorate do folderu ~/ (root)

2. Jak tworzysz nowy folder to używasz skryptu ./create_folder.sh i automatycznie wszystkie potrzebne pliki są kopiowane

3. Wrzucasz wszystkie pliki .dat .jk potrzebne do działania dla ModFEM to folderu który utworzyłeś za pomocą ./create_folder.sh
(NIE w scripts, czy work_speed_up ---> jak wywołasz ls to żeby pliki były obok skryptu ./create_folder.sh i folderu scripts)

4. Najlepiej na drugim wierszu poleceń wchodzisz do scripts i teraz masz wybór

Wszystko co tutaj stworzyłem ma na celu przyśpieszenie pracy.
- make_modfem.sh ---> zamiast szukać po plikach odpalasz skrypt i kompilujesz
- manual_modfem_prism.sh ---> zamiast wpisywać długą ścieżkę odpalasz skrypt i działa
- modfem_prism_std.sh ---> jak odpalisz nano na skrypt to zobaczysz, że odpala on ModFEM w trybie wsadowym (z wykorzystaniem input_interactive.txt (który później jest usuwany, żeby nie przeszkadzał)). Sam możesz wybierać jaki opcje dla ModFEM wybierzesz modyfikując ten skrypt. Domyślnie działa tak, że 1 parametr określa ile razy zostanie wywołana adaptacje siatki przed rozwiązaniem "s". Skrypt tworzy lokalnie plik output_from_modfem.txt który zawierz wszystkie informacje który ModFEM normalnie wyświetla na ekranie
- analize.sh ---> prosty skrypt do wyciągnięcie tylko interesujących nas informacji z pliku output_from_modfem.txt. Można pozmieniać dodać grepy na aktualna zapotrzebowanie, tworzy plik analized_output.txt

#######################################

Teraz kamień milowy pracy z ModFEM, wisienka na torcie.
-/work_speed_up/run_me.sh ---> wszystko co wcześniej tylko jeszcze lepiej i przyjemniej. Teraz jako 1 parametr podajemy liczbę adaptacji, do której ModFEM powoli dojdzie i na bieżąco pokaże dane oraz zapisze wersje oryginalną i przeanalizowaną do katalogu ~/DATA. ./run_me.sh 3 zacznie od 0, potem 1,2,3. Tak samo jak wcześniej jak najbardziej można modyfikować param_analize.sh i from_folder_to_one_big_folder_modfem_prism_std.sh na aktualne potrzeby. Jak na razie największe ułatwienie.

Chcesz dane do wykresów? 
Na wybranych plikach odpalasz ./run_me.sh
Wszystko czego potrzebujesz znajdziesz w folderze ~/DATA
Pobierasz cały folder na pulpit i rozkoszujesz się prostotą wykonanego zadania
