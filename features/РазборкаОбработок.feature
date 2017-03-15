# language: ru

Функционал: Разборка внешних обработок
    Как разработчик
    Я хочу иметь возможность разобрать внешние обработки 1С на исходники
    Чтобы выполнять коллективную разработку проекта 1С

#Подготовка репозитория и рабочего каталога проекта 1С
Контекст:
    Допустим я выключаю отладку лога с именем "oscript.app.vanessa-runner"
    И Я очищаю параметры команды "oscript" в контексте 

    Допустим Я создаю временный каталог и сохраняю его в контекст
    И Я устанавливаю временный каталог как рабочий каталог
    Допустим Я создаю каталог "build/out" в рабочем каталоге
    И Я копирую файл "fixture.epf" из каталога "tests/fixtures" проекта в подкаталог "build/out" рабочего каталога

    И Я установил рабочий каталог как текущий каталог
    # И Я показываю рабочий каталог
    # И Я показываю текущий каталог

    Допустим Я сохраняю каталог проекта в контекст

Сценарий: Разборка одной внешней обработки с временной базой
    
    # Допустим я включаю отладку лога с именем "oscript.app.vanessa-runner"
    # Допустим я включаю отладку лога с именем "oscript.lib.commands"
    Допустим каталог "epf" не существует
    Когда Я выполняю команду "oscript" c параметрами "<КаталогПроекта>/tools/runner.os decompileepf build/out/fixture.epf epf"
    # Тогда Я сообщаю вывод команды "oscript"
    Тогда Код возврата команды "oscript" равен 0
    # И каталог "epf/fixture/Тест1" существует
    # И файл "epf/fixture/Тест1.xml" существует
    И файл "epf/fixture\Тест1\Ext\ObjectModule.bsl" существует
    И файл "epf/fixture\Тест1\Ext\ObjectModule.bsl" содержит 'Сообщить("Обработка Тест1");'

    Тогда Вывод команды "oscript" содержит
    """
        vanessa-runner v0.6.0
        LoadFile: ok    
    """
    # Тогда Вывод команды "oscript" содержит "Выгрузка внешней обработки или отчета в XML."
    # Тогда Вывод команды "oscript" содержит
    # """
    #     Формат: Иерархический
    #     Выгрузка завершена. Суммарное время выполнения операции:    
    # """

# TODO Сценарий: Разборка одной внешней обработки с явно заданной базой
# TODO Сценарий: Разборка каталога внешних обработок с явно заданной базой
# TODO Сценарий: Разборка каталога внешних обработок с временной базой
