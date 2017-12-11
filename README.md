# Програма по прийому замовлень

Є виробництво, щось продукує,
З іншого боку - клієнти.

На виробництві є менеджери.
Менеджер оновлює асортимент "хліба" і ціну.

Клієнти знають що виробництво "пече хліб" і замовляють його по телефону.

Телефонні замовлення не зручні, адже, на словах легко щось не почути, не зрозуміти, забути.

Програма має на меті полегшити процедуру замовлень продукції.

## Чернетка функціоналу

Клієнт може:
- зайти на сайт, авторизуватись,
- побачити наявні пропозиції, мати можливість вибрати необхідне,
- зробити замовлення,
- вказати опції замовлення якщо вони доступні для позиції (наприклад: коли привезти (ранок/вечір)).

Процедура замовлення схожа на існуючі у веб магазинах.

На виробництві:
- отримують,
- переглядають і підтверджують замовлення.

Після підтвердження замовлення:

- статус замовлення оновлюється на сайті,
- опціонально клієнту надсилається повідомлення.


Також клієнт може:
- Переглядати власні замовлення
- Скасовувати замовлення (якщо вони не пішли на виконання)

### Технічні деталі.

є табличкою із замовленнями:

|код| номер замовлення| код клієнта| назва клієнта | код контрагента | назва контрагента | дата створення замовлення |
|---|-----------------|------------|---------------|-----------------|-------------------|---------------------------|
||||||||

Кожне замовлення містить

| номер товару | назва товару | кількість | ціна за од |  |
|---|---|---|---|---|
|   |   |   |   |   |


Дані по продуктах надходять з бухгалтерії:

- Виробники
- Контрагенти
- Товари
- Ціни (історія цін)


### Реєстрація користувачів

- Виробник реєструє контрагента і один чи декілька адміністративних облікових записів.
- Відповідальні особи (представники) контрагентів створюють власних користувачів
і надають їм ім'я і пароль входу.
