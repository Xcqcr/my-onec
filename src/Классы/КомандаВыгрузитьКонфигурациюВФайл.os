///////////////////////////////////////////////////////////////////////////////////////////////////
//
// Выполнение команды/действия в 1С:Предприятие в режиме тонкого/тонкого клиента с передачей запускаемых обработок и параметров
//
// TODO добавить фичи для проверки команды
// 
// Служебный модуль с набором методов работы с командами приложения
//
// Структура модуля реализована в соответствии с рекомендациями 
// oscript-app-template (C) EvilBeaver
//
///////////////////////////////////////////////////////////////////////////////////////////////////

#Использовать logos
#Использовать v8runner

Перем Лог;

///////////////////////////////////////////////////////////////////////////////////////////////////
// Прикладной интерфейс

Процедура ЗарегистрироватьКоманду(Знач ИмяКоманды, Знач Парсер) Экспорт

	ТекстОписания = 
		"     Выгружает файл конфигурации из ИБ
		|     ";

	ОписаниеКоманды = Парсер.ОписаниеКоманды(ПараметрыСистемы.ВозможныеКоманды().ВыгрузитьКонфигурациюВФайл, 
		ТекстОписания);

	Парсер.ДобавитьПозиционныйПараметрКоманды(ОписаниеКоманды, "cfpath", "Путь к результату - выгружаемому файлу конфигурации (*.cf)");

	Парсер.ДобавитьКоманду(ОписаниеКоманды);
	
КонецПроцедуры // ЗарегистрироватьКоманду

// Выполняет логику команды
// 
// Параметры:
//   ПараметрыКоманды - Соответствие - Соответствие ключей командной строки и их значений
//   ДополнительныеПараметры (необязательно) - Соответствие - дополнительные параметры
//
Функция ВыполнитьКоманду(Знач ПараметрыКоманды, Знач ДополнительныеПараметры = Неопределено) Экспорт

	Лог = ДополнительныеПараметры.Лог;

	// TODO отрефакторить получение ЗапускатьТолстыйКлиент

	МенеджерКонфигуратора = Новый МенеджерКонфигуратора;

	МенеджерКонфигуратора.ВыгрузитьКонфигурациюВФайл(
		ПараметрыКоманды["cfpath"],
		ПараметрыКоманды["--ibname"], ПараметрыКоманды["--db-user"], ПараметрыКоманды["--db-pwd"],
		ПараметрыКоманды["--v8version"]); 

	Возврат МенеджерКомандПриложения.РезультатыКоманд().Успех;
КонецФункции // ВыполнитьКоманду

