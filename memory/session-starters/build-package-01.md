# build-package-01 — стартер сессии S-001: сборка core + привязка к проекту

> Исполнитель: воркер-агент (свежий контекст). Оркестратор написал, оператор запускает.
> Ветка: `session/2026-07-12-build-core` (уже создана первым коммитом; работать в ней).
> Донор гейта и локация клона проекта передаются в тексте запуска (в файле путей нет).
> Гейт сдачи: супервизор проверяет, оператор коммитит/мержит. Кто жмёт промежуточные
> коммиты в session-ветке — по вердикту D-006 (см. decisionLog) на момент запуска.

## Рамки

1. Файлы писать только файловыми инструментами (Write/Edit); bash — read-only.
2. Слои строго: `core/` — EN, БЕЗ имён и фактов конкретных проектов (включая
   проекты-доноры и банковские контексты — ядро нейтрально, это будущий продукт);
   `project-familycode/` — вся привязка; handover-тексты — RU.
3. Пиктограммы в файлах не писать (в текстах о маркерах — кодпоинты/слова).
   LF, UTF-8, без BOM, без абсолютных путей в содержимом.
4. Существующий скелет (hook, AGENTS, CLAUDE, README, SESSIONS, memory) не переписывать —
   дополнять; расхождения — surface в сдачу.
5. Проект familycode: клон read-only, только разведка; ни одной правки.

## Объём

### 1. `core/00-frame/FRAME.md`
Рамка: дом правил (этот пакет) + репозитории-участники; спуск правил тремя слоями
(дом → hook репо → адаптеры-указатели, в адаптерах правил нет); поток вверх
(наблюдения → журнал/память → судит человек); честные статусы (никакой участник
не повышает свой статус сам); минимальный словарь (home, member repo, hook, adapter,
gate, session). Принципы: fail-closed read-first; surface-don't-fix; authority=human;
truth=filesystem+git; link-don't-duplicate.

### 2. `core/10-codification/CODIFICATION.md`
Кодировки: LF, UTF-8, no BOM, no NUL. Пиктограммы — запрещены вне allowlist
(в документации о них — кодпоинты). Абсолютные диск-пути в содержимом — запрещены
вне allowlist. Языки по слоям: код и идентификаторы — EN; машинные правила — EN;
человеческий слой — выбор проекта (зафиксировать в его hook). Commit-messages — EN,
imperative, без секретов. Имена файлов/веток — ASCII, без пробелов.

### 3. `core/20-operational/OPERATIONAL-RULES.md` + `AGENT-CONDUCT.md`
Операционные: surface-don't-fix; authority=human (merge, правила, статусы);
session-contract сдачи (scope done / out-of-scope / матрица верификации
Artifact-Check-Expected-Actual-Pass / files touched / статус честно); секреты
не попадают в репо (redaction-first, .env вне трекинга); truth=fs+git.
Agent-conduct: оркестратор пишет стартеры, не переписывает правила («execute the
repo hook first»); воркер — свежий контекст, объём из стартера, ничего сверх;
ревьюер/супервизор — гейт перед человеком; мультиагентность: одна сессия = одна
ветка = один комплект ролей; агент не изобретает статусы и причины.

### 4. `core/30-memory/MEMORY-SPEC.md`
Слой памяти репо: README (карта) / activeContext / decisionLog (D-серия, судит
человек) / session-notes / session-starters. Lean-профиль допустим; каждое усечение —
записанное решение. Память = короткие записи + ссылки.

### 5. `core/40-sessions/SESSION-PROTOCOL.md`
Полный протокол: id S-NNN; ДО работы — строка регистрации в SESSIONS.md на main
(id, дата, ветка, цель, агент/инструмент, оператор, status=active); ветка
`session/<YYYY-MM-DD>-<topic>`; артефакты коммитятся в ветку сразу после создания
(commit-message EN); закрытие: session-note с матрицей + PR в main; CI-гейт на PR;
merge — человек; статус в SESSIONS.md → merged/abandoned(+причина). Брошенные
сессии не стираются — закрываются записью.

### 6. `core/50-gates/GATES-MAP.md` + `core/50-gates/githooks/`
Карта гейтов (семена): session-start (регистрация есть?), local pre-commit
(кодификация), PR/CI (тот же чек на сервере), merge (ревью человека),
release/tag (опционально), memory-gate (изменил правила — обнови decisionLog).
githooks: портировать ТРОЙКУ из донора (передан в запуске) — pre-commit,
check-codification.sh (закалённая версия: export локали, fail-closed при сбое grep),
codification.allow (пустой, с комментарием-инструкцией). Шапки скриптов — нейтральные
(без имён доноров). Самотест в этом репо: чистый набор exit 0, синтетика пяти
классов exit 1 (фикстуры .tmp.md, байтовые — через хост, убрать до сдачи).

### 7. `core/60-ci/github-actions/codification-gate.yml`
Workflow на pull_request: checkout, определить изменённые файлы PR, прогнать
check-codification.sh по ним, fail при нарушении. Комментарий: как подключить
(скопировать в .github/workflows/ проекта) и как сделать required status check.

### 8. `core/70-adapters/ADAPTERS.md` + `templates/`
Матрица: AGENTS.md — нативно читают Codex, GitHub Copilot/VS Code, Cursor, Claude
и др.; CLAUDE.md — дубль-подстраховка; опционально .cursor/rules и
.github/copilot-instructions.md — только указатели. Правил в адаптерах нет.
Шаблоны с плейсхолдерами {{PROJECT_NAME}}, {{HUMAN_LAYER_LANG}}, {{STATUS}}:
FEDERATION-HOOK.template.md, AGENTS.template.md, CLAUDE.template.md,
SESSIONS.template.md, memory-набор (README/activeContext/decisionLog),
session-starter.template.md.

### 9. `project-familycode/` — привязка
Разведка клона (read-only; локация в запуске): структура, стек, язык лица,
есть ли доки/CI/AGENTS. Затем из шаблонов — готовые файлы ПОД проект:
FEDERATION-HOOK.md (статус: проект на пре-анализе), AGENTS.md, CLAUDE.md,
SESSIONS.md (пустой журнал), memory-сид, githooks (копия), workflow.
`ONBOARDING.md` (RU, для ведущего): шаг-за-шагом — какие файлы куда, команда
активации гейта, настройка branch protection (require PR + required check),
как выглядит первая сессия по протоколу. Если клона нет — собрать привязку
по нейтральным дефолтам с явными TODO-метками «уточнить по репо» и surface в сдачу.

## Сдача (session-note в memory/session-notes/ + финальное сообщение)
Матрица верификации по каждому разделу объёма; самотест гейта; список файлов;
git-блок оператору (add по файлам, commit-message EN, push ветки); находки; статус
Complete/Partial честно.
