<?php
/**
 * @package    JShopping - States of Russian Federation
 * @version    1.0.0
 * @author     Artem Vasilev - webmasterskaya.xyz
 * @copyright  Copyright (c) 2020 Webmasterskaya. All rights reserved.
 * @license    GNU/GPL license: https://www.gnu.org/copyleft/gpl.html
 * @link       https://webmasterskaya.xyz/
 */

$token = '__TOKEN__';

$input = [
	'Республика Адыгея',
	'Республика Башкортостан',
	'Республика Бурятия',
	'Республика Алтай',
	'Республика Дагестан',
	'Республика Ингушетия',
	'Республика Кабардино-Балкарская',
	'Республика Калмыкия',
	'Республика Карачаево-Черкесская',
	'Республика Карелия',
	'Республика Коми',
	'Республика Марий Эл',
	'Республика Мордовия',
	'Республика Саха /Якутия/',
	'Республика Северная Осетия - Алания',
	'Республика Татарстан',
	'Республика Тыва',
	'Республика Удмуртская',
	'Республика Хакасия',
	'Республика Чеченская',
	'Чувашская Республика - Чувашия',
	'Алтайский край',
	'Краснодарский край',
	'Красноярский край',
	'Приморский край',
	'Ставропольский край',
	'Хабаровский край',
	'Амурская область',
	'Архангельская область',
	'Астраханская область',
	'Белгородская область',
	'Брянская область',
	'Владимирская область',
	'Волгоградская область',
	'Вологодская область',
	'Воронежская область',
	'Ивановская область',
	'Иркутская область',
	'Калининградская область',
	'Калужская область',
	'Камчатский край',
	'Кемеровская областьасть - Кузбасс',
	'Кировская область',
	'Костромская область',
	'Курганская область',
	'Курская область',
	'Ленинградская область',
	'Липецкая область',
	'Магаданская область',
	'Московская область',
	'Мурманская область',
	'Нижегородская область',
	'Новгородская область',
	'Новосибирская область',
	'Омская область',
	'Оренбургская область',
	'Орловская область',
	'Пензенская область',
	'Пермский край',
	'Псковская область',
	'Ростовская область',
	'Рязанская область',
	'Самарская область',
	'Саратовская область',
	'Сахалинская область',
	'Свердловская область',
	'Смоленская область',
	'Тамбовская область',
	'Тверская область',
	'Томская область',
	'Тульская область',
	'Тюменская область',
	'Ульяновская область',
	'Челябинская область',
	'Забайкальский край',
	'Ярославская область',
	' город Москва',
	' город Санкт-Петербург',
	'Еврейская Аобл',
	'Ненецкий АО',
	'Ханты-Мансийский Автономный окру город - Югра',
	'Чукотский АО',
	'Ямало-Ненецкий АО',
	'Республика Крым',
	' город Севастополь',
	' город Байконур'
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
 * @version    1.0.0
 * @author     Artem Vasilev - webmasterskaya.xyz
 * @copyright  Copyright (c) 2020 Webmasterskaya. All rights reserved.
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
