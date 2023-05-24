/**
 * @package    JShopping - States of Russian Federation
 * @version    1.1.1
 * @author     Artem Vasilev - webmasterskaya.xyz
 * @copyright  Copyright (c) 2023 Webmasterskaya. All rights reserved.
 * @license    GNU/GPL license: https://www.gnu.org/copyleft/gpl.html
 * @link       https://webmasterskaya.xyz/
 */

create table if not exists `#__jshopping_states`
(
    `state_id`      int(11)      not null auto_increment,
    `country_id`    int(11)      not null,
    `state_publish` tinyint(4)   not null,
    `ordering`      smallint(6)  not null,
    `name_en-GB`    varchar(255) not null,
    `name_de-DE`    varchar(255) not null,
    `name_ru-RU`    varchar(255) not null,
    primary key (`state_id`)
);

delete from `#__jshopping_states` where `country_id` = 176;

insert into `#__jshopping_states` (`country_id`, `state_publish`, `ordering`, `name_en-GB`, `name_de-DE`, `name_ru-RU`)
values ('176', '1', '1', 'respublika Adygeya', 'respublika Adygeya', 'Респ Адыгея'),
       ('176', '1', '2', 'respublika Altay', 'respublika Altay', 'Респ Алтай'),
       ('176', '1', '3', 'kray Altaysky', 'kray Altaysky', 'Алтайский край'),
       ('176', '1', '4', 'oblast Amurskaya', 'oblast Amurskaya', 'Амурская обл'),
       ('176', '1', '5', 'oblast Arkhangelskaya', 'oblast Arkhangelskaya', 'Архангельская обл'),
       ('176', '1', '6', 'oblast Astrakhanskaya', 'oblast Astrakhanskaya', 'Астраханская обл'),
       ('176', '1', '7', 'Saint-Petersburg city', 'Saint-Petersburg city', 'г Санкт-Петербург'),
       ('176', '1', '8', 'respublika Bashkortostan', 'respublika Bashkortostan', 'Респ Башкортостан'),
       ('176', '1', '9', 'oblast Belgorodskaya', 'oblast Belgorodskaya', 'Белгородская обл'),
       ('176', '1', '10', 'oblast Bryanskaya', 'oblast Bryanskaya', 'Брянская обл'),
       ('176', '1', '11', 'respublika Buryatiya', 'respublika Buryatiya', 'Респ Бурятия'),
       ('176', '1', '12', 'oblast Vladimirskaya', 'oblast Vladimirskaya', 'Владимирская обл'),
       ('176', '1', '13', 'oblast Volgogradskaya', 'oblast Volgogradskaya', 'Волгоградская обл'),
       ('176', '1', '14', 'oblast Vologodskaya', 'oblast Vologodskaya', 'Вологодская обл'),
       ('176', '1', '15', 'oblast Voronezhskaya', 'oblast Voronezhskaya', 'Воронежская обл'),
       ('176', '1', '16', 'respublika Dagestan', 'respublika Dagestan', 'Респ Дагестан'),
       ('176', '1', '17', 'respublika Donetskaya Narodnaya', 'respublika Donetskaya Narodnaya', 'Донецкая Народная респ'),
       ('176', '1', '18', 'avtonomnaya oblast Evreyskaya', 'avtonomnaya oblast Evreyskaya', 'Еврейская Аобл'),
       ('176', '1', '19', 'kray Zabaykalsky', 'kray Zabaykalsky', 'Забайкальский край'),
       ('176', '1', '20', 'oblast Zaporozhskaya', 'oblast Zaporozhskaya', 'Запорожская обл'),
       ('176', '1', '21', 'oblast Ivanovskaya', 'oblast Ivanovskaya', 'Ивановская обл'),
       ('176', '1', '22', 'respublika Ingushetiya', 'respublika Ingushetiya', 'Респ Ингушетия'),
       ('176', '1', '23', 'oblast Irkutskaya', 'oblast Irkutskaya', 'Иркутская обл'),
       ('176', '1', '24', 'respublika Kabardino-Balkarskaya', 'respublika Kabardino-Balkarskaya', 'Кабардино-Балкарская Респ'),
       ('176', '1', '25', 'oblast Kaliningradskaya', 'oblast Kaliningradskaya', 'Калининградская обл'),
       ('176', '1', '26', 'respublika Kalmykiya', 'respublika Kalmykiya', 'Респ Калмыкия'),
       ('176', '1', '27', 'oblast Kaluzhskaya', 'oblast Kaluzhskaya', 'Калужская обл'),
       ('176', '1', '28', 'kray Kamchatsky', 'kray Kamchatsky', 'Камчатский край'),
       ('176', '1', '29', 'respublika Karachaevo-Cherkesskaya', 'respublika Karachaevo-Cherkesskaya', 'Карачаево-Черкесская Респ'),
       ('176', '1', '30', 'respublika Kareliya', 'respublika Kareliya', 'Респ Карелия'),
       ('176', '1', '31', 'oblast Kemerovskaya oblast - Kuzbass', 'oblast Kemerovskaya oblast - Kuzbass', 'Кемеровская область - Кузбасс'),
       ('176', '1', '32', 'oblast Kirovskaya', 'oblast Kirovskaya', 'Кировская обл'),
       ('176', '1', '33', 'respublika Komi', 'respublika Komi', 'Респ Коми'),
       ('176', '1', '34', 'oblast Kostromskaya', 'oblast Kostromskaya', 'Костромская обл'),
       ('176', '1', '35', 'kray Krasnodarsky', 'kray Krasnodarsky', 'Краснодарский край'),
       ('176', '1', '36', 'kray Krasnoyarsky', 'kray Krasnoyarsky', 'Красноярский край'),
       ('176', '1', '37', 'respublika Krym', 'respublika Krym', 'Респ Крым'),
       ('176', '1', '38', 'oblast Kurganskaya', 'oblast Kurganskaya', 'Курганская обл'),
       ('176', '1', '39', 'oblast Kurskaya', 'oblast Kurskaya', 'Курская обл'),
       ('176', '1', '40', 'oblast Leningradskaya', 'oblast Leningradskaya', 'Ленинградская обл'),
       ('176', '1', '41', 'oblast Lipetskaya', 'oblast Lipetskaya', 'Липецкая обл'),
       ('176', '1', '42', 'respublika Luganskaya Narodnaya', 'respublika Luganskaya Narodnaya', 'Луганская Народная респ'),
       ('176', '1', '43', 'oblast Magadanskaya', 'oblast Magadanskaya', 'Магаданская обл'),
       ('176', '1', '44', 'respublika Mary El', 'respublika Mary El', 'Респ Марий Эл'),
       ('176', '1', '45', 'respublika Mordoviya', 'respublika Mordoviya', 'Респ Мордовия'),
       ('176', '1', '46', 'Moscow city', 'Moscow city', 'г Москва'),
       ('176', '1', '47', 'oblast Moskovskaya', 'oblast Moskovskaya', 'Московская обл'),
       ('176', '1', '48', 'oblast Murmanskaya', 'oblast Murmanskaya', 'Мурманская обл'),
       ('176', '1', '49', 'avtonomny okrug Yamalo-Nenetsky', 'avtonomny okrug Yamalo-Nenetsky', 'Ямало-Ненецкий АО'),
       ('176', '1', '50', 'oblast Nizhegorodskaya', 'oblast Nizhegorodskaya', 'Нижегородская обл'),
       ('176', '1', '51', 'oblast Novgorodskaya', 'oblast Novgorodskaya', 'Новгородская обл'),
       ('176', '1', '52', 'oblast Novosibirskaya', 'oblast Novosibirskaya', 'Новосибирская обл'),
       ('176', '1', '53', 'oblast Omskaya', 'oblast Omskaya', 'Омская обл'),
       ('176', '1', '54', 'oblast Orenburgskaya', 'oblast Orenburgskaya', 'Оренбургская обл'),
       ('176', '1', '55', 'oblast Orlovskaya', 'oblast Orlovskaya', 'Орловская обл'),
       ('176', '1', '56', 'oblast Penzenskaya', 'oblast Penzenskaya', 'Пензенская обл'),
       ('176', '1', '57', 'kray Permsky', 'kray Permsky', 'Пермский край'),
       ('176', '1', '58', 'kray Primorsky', 'kray Primorsky', 'Приморский край'),
       ('176', '1', '59', 'oblast Pskovskaya', 'oblast Pskovskaya', 'Псковская обл'),
       ('176', '1', '60', 'oblast Rostovskaya', 'oblast Rostovskaya', 'Ростовская обл'),
       ('176', '1', '61', 'oblast Ryazanskaya', 'oblast Ryazanskaya', 'Рязанская обл'),
       ('176', '1', '62', 'oblast Samarskaya', 'oblast Samarskaya', 'Самарская обл'),
       ('176', '1', '63', 'Saint-Petersburg city', 'Saint-Petersburg city', 'г Санкт-Петербург'),
       ('176', '1', '64', 'oblast Saratovskaya', 'oblast Saratovskaya', 'Саратовская обл'),
       ('176', '1', '65', 'respublika Sakha /Yakutiya/', 'respublika Sakha /Yakutiya/', 'Респ Саха /Якутия/'),
       ('176', '1', '66', 'oblast Sakhalinskaya', 'oblast Sakhalinskaya', 'Сахалинская обл'),
       ('176', '1', '67', 'oblast Sverdlovskaya', 'oblast Sverdlovskaya', 'Свердловская обл'),
       ('176', '1', '68', 'gorod Sevastopol', 'gorod Sevastopol', 'г Севастополь'),
       ('176', '1', '69', 'respublika Severnaya Osetiya - Alaniya', 'respublika Severnaya Osetiya - Alaniya', 'Респ Северная Осетия - Алания'),
       ('176', '1', '70', 'oblast Smolenskaya', 'oblast Smolenskaya', 'Смоленская обл'),
       ('176', '1', '71', 'kray Stavropolsky', 'kray Stavropolsky', 'Ставропольский край'),
       ('176', '1', '72', 'oblast Tambovskaya', 'oblast Tambovskaya', 'Тамбовская обл'),
       ('176', '1', '73', 'respublika Tatarstan', 'respublika Tatarstan', 'Респ Татарстан'),
       ('176', '1', '74', 'oblast Tverskaya', 'oblast Tverskaya', 'Тверская обл'),
       ('176', '1', '75', 'oblast Tomskaya', 'oblast Tomskaya', 'Томская обл'),
       ('176', '1', '76', 'oblast Tulskaya', 'oblast Tulskaya', 'Тульская обл'),
       ('176', '1', '77', 'respublika Tyva', 'respublika Tyva', 'Респ Тыва'),
       ('176', '1', '78', 'oblast Tyumenskaya', 'oblast Tyumenskaya', 'Тюменская обл'),
       ('176', '1', '79', 'respublika Udmurtskaya', 'respublika Udmurtskaya', 'Удмуртская Респ'),
       ('176', '1', '80', 'oblast Ulyanovskaya', 'oblast Ulyanovskaya', 'Ульяновская обл'),
       ('176', '1', '81', 'kray Khabarovsky', 'kray Khabarovsky', 'Хабаровский край'),
       ('176', '1', '82', 'respublika Khakasiya', 'respublika Khakasiya', 'Респ Хакасия'),
       ('176', '1', '83', 'avtonomny okrug Khanty-Mansiysky Avtonomny okrug - Yugra', 'avtonomny okrug Khanty-Mansiysky Avtonomny okrug - Yugra', 'Ханты-Мансийский Автономный округ - Югра'),
       ('176', '1', '84', 'oblast Khersonskaya', 'oblast Khersonskaya', 'Херсонская обл'),
       ('176', '1', '85', 'oblast Chelyabinskaya', 'oblast Chelyabinskaya', 'Челябинская обл'),
       ('176', '1', '86', 'respublika Chechenskaya', 'respublika Chechenskaya', 'Чеченская Респ'),
       ('176', '1', '87', 'Chuvashiya Chuvashskaya respublika', 'Chuvashiya Chuvashskaya respublika', 'Чувашская республика - Чувашия'),
       ('176', '1', '88', 'avtonomny okrug Chukotsky', 'avtonomny okrug Chukotsky', 'Чукотский АО'),
       ('176', '1', '89', 'avtonomny okrug Yamalo-Nenetsky', 'avtonomny okrug Yamalo-Nenetsky', 'Ямало-Ненецкий АО'),
       ('176', '1', '90', 'oblast Yaroslavskaya', 'oblast Yaroslavskaya', 'Ярославская обл');
