﻿&НаКлиенте
Перем КонтекстЯдра;

// { Plugin interface

&НаКлиенте
Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	КонтекстЯдра = КонтекстЯдраПараметр;
КонецПроцедуры

&НаКлиенте
Функция ОписаниеПлагина(ВозможныеТипыПлагинов) Экспорт
	Возврат ОписаниеПлагинаНаСервере(ВозможныеТипыПлагинов);
КонецФункции

&НаСервере
Функция ОписаниеПлагинаНаСервере(ВозможныеТипыПлагинов)
	Возврат ЭтотОбъектНаСервере().ОписаниеПлагина(ВозможныеТипыПлагинов);
КонецФункции
// } Plugin interface

// { Helpers
&НаСервере
Функция ЭтотОбъектНаСервере()
	Возврат РеквизитФормыВЗначение("Объект");
КонецФункции
// } Helpers


&НаКлиенте
Процедура ПроверитьРавенствоТабличныхДокументовТолькоПоЗначениям(ТабДок1, ТабДок2, УчитыватьТолькоВидимыеКолонкиИлиДопСообщениеОшибки = Ложь, УчитыватьТолькоВидимыеСтрокиИлиДопСообщениеОшибки = Ложь, Знач ДопСообщениеОшибки = "") Экспорт
	ПроверитьРавенствоТабличныхДокументовТолькоПоЗначениямСервер(ТабДок1, ТабДок2, УчитыватьТолькоВидимыеКолонкиИлиДопСообщениеОшибки, УчитыватьТолькоВидимыеСтрокиИлиДопСообщениеОшибки, ДопСообщениеОшибки);
КонецПроцедуры

&НаСервере
Процедура ПроверитьРавенствоТабличныхДокументовТолькоПоЗначениямСервер(ТабДок1, ТабДок2, УчитыватьТолькоВидимыеКолонкиИлиДопСообщениеОшибки = Ложь, УчитыватьТолькоВидимыеСтрокиИлиДопСообщениеОшибки = Ложь, Знач ДопСообщениеОшибки = "") Экспорт
	ЭтотОбъектНаСервере().ПроверитьРавенствоТабличныхДокументовТолькоПоЗначениям(ТабДок1, ТабДок2, УчитыватьТолькоВидимыеКолонкиИлиДопСообщениеОшибки, УчитыватьТолькоВидимыеСтрокиИлиДопСообщениеОшибки, ДопСообщениеОшибки);
КонецПроцедуры
