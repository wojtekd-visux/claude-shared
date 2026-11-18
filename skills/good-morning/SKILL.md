---
name: good-morning
description: Poranny brief ze Slacka i ClickUpa, posortowany od najważniejszego. Używaj, gdy użytkownik wpisze /good-morning albo poprosi o poranne podsumowanie, „co mnie ominęło” lub „co dziś na mnie czeka”.
allowed-tools: mcp__clickup__clickup_get_user, mcp__clickup__clickup_filter_tasks, mcp__slack__slack_search_public_and_private, mcp__slack__slack_read_thread, mcp__slack__slack_read_channel, Bash(date:*)
---

# Poranny brief

Krótki brief w oknie czatu (bez plików i bez artefaktów), po polsku. Ma działać szybko: około 5–8 wywołań narzędzi, nie więcej.

## 1. Okno czasowe
Wywołaj `clickup_get_user` i weź z odpowiedzi `current_time` oraz `day_of_week`. Nie korzystaj z własnego zegara.
- Zwykły dzień: okno zaczyna się wczoraj o 00:00.
- Poniedziałek: okno zaczyna się w piątek o 00:00.
- W Slacku `after:YYYY-MM-DD` oznacza „po tym dniu”, więc podaj dzień PRZED początkiem okna. Przykład: środa, okno od wtorku, czyli `after:<poniedziałek>`.
Swój Slack user ID weź z opisu narzędzia `slack_search_public_and_private` („Current logged in user's user_id is …”).

## 2. Pobierz dane (wszystko równolegle, w jednej turze)
Każde wyszukiwanie w Slacku: `sort: timestamp`, `response_format: concise`, `limit: 20`.
1. Wzmianki: `<@MY_ID> after:DATE`
2. DM i rozmowy grupowe: `after:DATE -from:<@MY_ID>` z `channel_types: im,mpim`
3. Moje wiadomości (do sprawdzenia, co już załatwione): `from:<@MY_ID> after:DATE`
4. Kanały: `after:DATE -from:<@MY_ID>` z `channel_types: public_channel,private_channel` i `only_my_channels: true`
5. ClickUp: `clickup_filter_tasks` z `assignees: ["me"]`, `include_closed: false`, `fields: [status, priority, due_date, date_updated, list]`

Jeśli wynik ma kolejną stronę, pobierz ją tylko dla wzmianek i DM-ów.

## 3. Znane pułapki
- ClickUp zwraca też zadania w statusie `done`/`complete`/`closed`, mimo `include_closed: false`. Odfiltruj je sam.
- `due_date` i `date_updated` to milisekundy. Przelicz je jednym poleceniem: `TZ=Europe/Warsaw date -d @<sek> +%F`.
- Komentarzy i wyszukiwarki w ClickUpie nie używaj, bo zespół rozmawia na Slacku i są tam puste.
- Wyszukiwanie `in:#nazwa-kanału` bywa zawodne. Jeśli wiadomość jest ucięta, a jej sens jest ważny, przeczytaj wątek (`slack_read_thread`) albo kanał po ID. Najwyżej 2–3 takie dodatkowe wywołania.
- Pomijaj szum: Geekbot, #daily (standupy), #t-availability, #t-planned-unavailability, boty i wiadomości bez treści.

## 4. Ustal priorytety
- 🔴 **Ktoś czeka na mnie**: pytanie lub prośba skierowana do mnie (wzmianka albo DM), na którą NIE odpisałem później w tym samym kanale lub DM-ie (sprawdź na liście z punktu 3), a także moje własne obietnice („później dodam…”, „jutro postawię…”).
- 🟠 **Terminy**: otwarte zadania po terminie, z terminem dziś lub w ciągu 2 dni roboczych, z priorytetem urgent/high. Pokaż je w tabeli: zadanie (jako link) | projekt | status | termin. Jeśli kilka zadań z jednego projektu ma status `blocked` po terminie, zgrupuj je w jedną uwagę.
- 🟡 **Do wiadomości**: istotne wydarzenia na kanałach projektowych (`i-*`, `ext-p-*`), zwłaszcza powiązane z moimi zadaniami w ClickUpie, oraz ustalenia z DM-ów. Najwyżej 1–2 zdania na projekt.
- ✅ **Załatwione**: jedna linia z tym, co pominąłem, bo już odpowiedziałem.

## 5. Format
```
## 🌅 Brief: <dzień tygodnia> <DD.MM> (od <dzień okna>)
### 🔴 Ktoś czeka na Ciebie
### 🟠 Terminy
### 🟡 Do wiadomości
### ✅ Załatwione, pomijam
```
Pustą sekcję pomiń. Przy każdej pozycji z 🔴 podaj kanał, autora, godzinę i jednym zdaniem, czego potrzeba. Zadania z ClickUpa podawaj jako linki markdown z nazwą zadania. Całość ma się mieścić na jednym ekranie. Na końcu nie dopisuj pytań ani propozycji.
