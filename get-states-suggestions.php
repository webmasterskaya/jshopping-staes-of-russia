<?php
/**
 * @package    JShopping - States of Russian Federation
 * @version    1.1.1
 * @author     Artem Vasilev - webmasterskaya.xyz
 * @copyright  Copyright (c) 2023 Webmasterskaya. All rights reserved.
 * @license    GNU/GPL license: https://www.gnu.org/copyleft/gpl.html
 * @link       https://webmasterskaya.xyz/
 */

$token = '__TOKEN__';

$input = [
    'Республика Адыгея',
    'Республика Алтай',
    'Алтайский край',
    'Амурская область',
    'Архангельская область',
    'Астраханская область',
    ' город Байконур',
    'Республика Башкортостан',
    'Белгородская область',
    'Брянская область',
    'Республика Бурятия',
    'Владимирская область',
    'Волгоградская область',
    'Вологодская область',
    'Воронежская область',
    'Республика Дагестан',
    'Донецкая Народная Республика',
    'Еврейская автономная область',
    'Забайкальский край',
    'Запорожская область',
    'Ивановская область',
    'Республика Ингушетия',
    'Иркутская область',
    'Кабардино-Балкарская Республика',
    'Калининградская область',
    'Республика Калмыкия',
    'Калужская область',
    'Камчатский край',
    'Карачаево-Черкесская Республика',
    'Республика Карелия',
    'Кемеровская область - Кузбасс',
    'Кировская область',
    'Республика Коми',
    'Костромская область',
    'Краснодарский край',
    'Красноярский край',
    'Республика Крым',
    'Курганская область',
    'Курская область',
    'Ленинградская область',
    'Липецкая область',
    'Луганская Народная Республика',
    'Магаданская область',
    'Республика Марий Эл',
    'Республика Мордовия',
    ' город Москва',
    'Московская область',
    'Мурманская область',
    'Ненецкий автономный округ',
    'Нижегородская область',
    'Новгородская область',
    'Новосибирская область',
    'Омская область',
    'Оренбургская область',
    'Орловская область',
    'Пензенская область',
    'Пермский край',
    'Приморский край',
    'Псковская область',
    'Ростовская область',
    'Рязанская область',
    'Самарская область',
    ' город Санкт-Петербург',
    'Саратовская область',
    'Республика Саха (Якутия)',
    'Сахалинская область',
    'Свердловская область',
    ' город Севастополь',
    'Республика Северная Осетия - Алания',
    'Смоленская область',
    'Ставропольский край',
    'Тамбовская область',
    'Республика Татарстан (Татарстан)',
    'Тверская область',
    'Томская область',
    'Тульская область',
    'Республика Тыва',
    'Тюменская область',
    'Удмуртская Республика',
    'Ульяновская область',
    'Хабаровский край',
    'Республика Хакасия',
    'Ханты-Мансийский автономный округ - Югра',
    'Херсонская область',
    'Челябинская область',
    'Чеченская Республика',
    'Чувашская Республика - Чувашия',
    'Чукотский автономный округ',
    'Ямало-Ненецкий автономный округ',
    'Ярославская область',
];

$output = [];

$headers   = array();
$headers[] = 'Content-Type: application/json';
$headers[] = 'Accept: application/json';
$headers[] = 'Authorization: Token ' . $token;

$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, 'https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

$lang = [
	3 => 'en',
	4 => 'en',
	5 => 'ru',
];
$i    = 0;
foreach ($input as $item)
{
	$i++;
	$new = [176, 1, $i, '', '', ''];

	$suggestionGet = false;
	foreach ($lang as $p => $l)
	{
		curl_setopt($ch, CURLOPT_POSTFIELDS,
			"{ \"query\": \"" . trim($item) . "\", \"count\": 1, \"language\": \"" . $l . "\" }");

		$result = curl_exec($ch);

		if (curl_errno($ch))
		{
			echo 'Error:' . curl_error($ch);
			break;
		}

		$region = @json_decode($result, true)['suggestions'][0]['data']['region_with_type'];

		if (!empty($region))
		{
			$suggestionGet = true;
			$new[$p]       = $region;
		}
		else
		{
			break;
		}
	}
	if (!$suggestionGet)
	{
		continue;
	}
	$output[] = $new;
}
curl_close($ch);

$copy   = '/**
 * @package    JShopping - States of Russian Federation
 * @version    1.1.1
 * @author     Artem Vasilev - webmasterskaya.xyz
 * @copyright  Copyright (c) 2023 Webmasterskaya. All rights reserved.
 * @license    GNU/GPL license: https://www.gnu.org/copyleft/gpl.html
 * @link       https://webmasterskaya.xyz/
 */';
$create = 'create table if not exists `#__jshopping_states`
(
    `state_id`      int(11)      not null auto_increment,
    `country_id`    int(11)      not null,
    `state_publish` tinyint(4)   not null,
    `ordering`      smallint(6)  not null,
    `name_en-GB`    varchar(255) not null,
    `name_de-DE`    varchar(255) not null,
    `name_ru-RU`    varchar(255) not null,
    primary key (`state_id`)
);';
$delete = 'delete from `#__jshopping_states` where `country_id` = 176;';
$insert = 'insert into `#__jshopping_states` (`country_id`, `state_publish`, `ordering`, `name_en-GB`, `name_de-DE`, `name_ru-RU`)';

// Create update.sql
ob_start();
echo $copy;
echo PHP_EOL;
echo PHP_EOL;
echo $create;
echo PHP_EOL;
echo PHP_EOL;
echo $delete;
echo PHP_EOL;
echo PHP_EOL;
echo $insert;
echo PHP_EOL;
echo 'values';
foreach ($output as $n => $row)
{
	$str = " ('" . implode("', '", $row) . "'),";
	if ($n > 0)
	{
		$str = '      ' . $str;
	}
	if (!isset($output[$n + 1]))
	{
		$str = rtrim($str, ',') . ";";
	}
	echo $str . PHP_EOL;
}
file_put_contents(dirname(__FILE__) . '/update.sql', ob_get_clean());
