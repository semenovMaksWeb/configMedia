CREATE TABLE config.action_command (
	const_name varchar NOT NULL, -- Код действия команды
	"name" varchar NOT NULL, -- Имя действия комадны
	description varchar NULL, -- Описание  действия комадны
	schema_params json NULL, -- схема действии команды в формате [{name: $name,  type: $type }]
	CONSTRAINT action_command_pk PRIMARY KEY (const_name)
);
COMMENT ON TABLE config.action_command IS 'Таблица действии команд для указания их через интерфейс из списка';

-- Column comments

COMMENT ON COLUMN config.action_command.const_name IS 'Код действия команды';
COMMENT ON COLUMN config.action_command."name" IS 'Имя действия комадны';
COMMENT ON COLUMN config.action_command.description IS 'Описание  действия комадны';
COMMENT ON COLUMN config.action_command.schema_params IS 'схема действии команды в формате [{name: $name,  type: $type }]';


CREATE TABLE config.type_element (
	const_name varchar NOT NULL, -- id типа элемента
	"name" varchar NOT NULL, -- Названия типа элемента
	description varchar NULL, -- Описания типа элемента
	CONSTRAINT type_element_pk PRIMARY KEY (const_name)
);
COMMENT ON TABLE config.type_element IS 'Таблица с элементами для динамической отрисовки в интерфейсе';

-- Column comments

COMMENT ON COLUMN config.type_element.const_name IS 'id типа элемента';
COMMENT ON COLUMN config.type_element."name" IS 'Названия типа элемента';
COMMENT ON COLUMN config.type_element.description IS 'Описания типа элемента';


-- Создание типов элементов gui
INSERT INTO config.type_element (const_name, "name", description) VALUES('input', 'Поле ввода', 'Поле ввода');
INSERT INTO config.type_element (const_name, "name", description) VALUES('checkbox', 'Флаговая кнопка', 'Флаговая кнопка');
INSERT INTO config.type_element (const_name, "name", description) VALUES('select', 'Выбор из списка', 'Выбор из списка');
INSERT INTO config.type_element (const_name, "name", description) VALUES('inputArray', 'Поле ввода с массивом', 'Поле ввода, которое сохраняет массив введенных значении через символ "," если элемент один то вернут строку
Используется для: задания имени действия в конфиге.');
INSERT INTO config.type_element (const_name, "name", description) VALUES('ifsBlock', 'Генератор условии', 'Блочный компонент с помощью которого генерируются условия в конфиге
Используется для создания конфига IfsRunConfig.');
INSERT INTO config.type_element (const_name, "name", description) VALUES('сonfigElement', 'Генератор получения значении', 'Блочный компонент с помощью которого генерируется конфиг получения значения для его дальнейшей обработки
Используется для создания конфига StoreConfigElement.');
INSERT INTO config.type_element (const_name, "name", description) VALUES('storeConfigArray', 'Генератор получения множества значении', 'Блочный компонент с помощью которого генерируется конфиг получения значения значении в виде объекта.
Используется для генерация конфига StoreConfig.');
INSERT INTO config.type_element (const_name, "name", description) VALUES('jsonMapping', 'Генератор JsonMappingSchema', 'Блочный компонент для генерации JsonMappingSchema[]');
INSERT INTO config.type_element (const_name, "name", description) VALUES('storeSelect', 'Выбор данных с store', 'Выбор из списка данных хранящихся в store');
INSERT INTO config.type_element (const_name, "name", description) VALUES('commandList', 'Генератор команд', 'Блочный компонент с помощью которого генерируется конфиг команд');
INSERT INTO config.type_element (const_name, "name", description) VALUES('DBConfig', 'Генератор конфига подключения к бд', 'Генератор конфига подключения к бд');

-- создания действии для команд 
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('connectionDatabase', 'Подключение к бд', 'Подключение к бд', '[{"name": "connection","type": "DBConfig"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('sql', 'Вызов sql', 'Вызов sql', '[{"name":"type","type":"сonfigElement"},{"name":"connection","type":"сonfigElement"},{"name":"query","type":"input"},{"name":"params","type":"storeConfigArray"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('fileWrite', 'Сохранения в файл', 'Сохранения в файл строку
', '[{"name": "path","type": "сonfigElement", "name": "data","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('fileConfig', 'Вызвать др. файл с конфигом для выполнения логики', 'Вызвать др. файл с конфигом', '[{"name": "path","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('fileRead', 'Чтения файла', 'Чтения файла', '[{"name": "path","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('directoryFile', 'Получить список файлов', 'Получить весь список файлов в указанном каталоге', '[{"name": "path","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('mappingJson', 'Конвертация json ', 'Конвертация json из 1 формата в другой ', '[{"name": "json","type": "сonfigElement"},{"name": "schema","type": "jsonMapping"} ]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('for', 'Цикл', 'Прогнать цикл', '[{"name": "array","type": "сonfigElement"},{"name": "item","type": "inputArray"},{"name": "config","type": "commandList"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('initVar', 'Иницилизация переменной', 'Иницилизация переменной для заполнения или изменения ', '[{"name": "initVar","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('convertInDom', 'Конвертация из строки в dom-дерево', 'Конвертация из строки в dom-дерево', '[{"name": "html","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('findElementHtmlAll', 'Поиск элементов в dom-дереве', 'Поиск элементов в dom-дереве', '[{"name": "html","type": "сonfigElement"}, {"name": "selector","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('getInnerHtml', 'Получить innertHtml с dom-элемента', 'Получить innertHtml с dom-элемента', '[{"name": "html","type": "сonfigElement"}, {"name": "selector","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('getAtrHtml', 'Получить атрибут с dom-элемента', 'Получить атрибут с dom-элемента', '[{"name": "html","type": "сonfigElement"}, {"name": "selector","type": "сonfigElement"}, {"name": "nameArt","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('getTextContent', 'Получить textContent с dom-элемента', 'Получить textContent с dom-элемента', '[{"name": "html","type": "сonfigElement"}, {"name": "selector","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('convertValidString', 'Убрать лишние пробелы и переносы из строки', 'Убрать лишние пробелы и переносы из строки', '[{"name": "string","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('convertReplaceAll', 'Замена символов в строке', 'Замена символов в строке', '[{"name": "string","type": "сonfigElement"}, {"name": "searchString","type": "сonfigElement"}, {"name": "replaceString","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('convertListInKeyArray', 'Получить из массива объекта получить массив значение по ключу', 'Получить из массива объекта получить массив значение по ключу', '[{"name": "key","type": "сonfigElement"}, {"name": "list","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('downloadFileHttp', 'Скачать файл с интернета по http', 'Скачать файл с интернета по http', '[{"name": "path","type": "сonfigElement"}, {"name": "url","type": "сonfigElement"}, {"name": "fileName","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('webOpen', 'Открыть браузер в определенной вкладке', 'Открыть браузер в определенной вкладке', '[{"name": "url","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('webElementClick', 'Произвести клик на определенном элементе в браузере', 'Произвести клик на определенном элементе в браузере', '[{"name": "page","type": "сonfigElement"}, {"name": "selector","type": "сonfigElement"}]'::json);
INSERT INTO config.action_command (const_name, "name", description, schema_params) VALUES('webGetInnerHTML', 'Получить html определенного элемента в браузере', 'Получить html определенного элемента в браузере', '[{"name": "page","type": "сonfigElement"}, {"name": "selector","type": "сonfigElement"}]'::json);