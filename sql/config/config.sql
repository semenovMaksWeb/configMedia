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