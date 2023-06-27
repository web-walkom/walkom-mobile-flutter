import 'package:walkom_mobile_flutter/repositories/users/models/models.dart';

// System
const APP_NAME = "walkom";
const VERSION = "1.0.0+1";
const DATE_BUILD = "27.06.2023";
User? USER = null;

// Keys
const GOOGLE_API_KEY = "AIzaSyDUMWb2ozasrHT-e3TLhDzGG-KHPyztW2k";

// Text
const TEXT_EXCURSIONS = "Экскурсии";
const TEXT_ADD_FAVORITE = "Добавить в избранное";
const TEXT_REPORT_ERROR = "Сообщить об ошибке";
const TEXT_DELETE_FILES = "Удалить файлы экскурсии";
const TEXT_PROFILE = "Профиль";
const TEXT_AUTH = "Авторизация";
const TEXT_PERSONAL_DATA = "Личные данные";
const TEXT_FAVORITE = "Избранное";
const TEXT_DATA_AND_MEMORY = "Данные и память";
const TEXT_SETTINGS = "Настройки";
const TEXT_DECORATION = "Оформление";
const TEXT_ABOUT_APP = "О приложении";
const TEXT_PRIVACY_POLICY = "Политика конфиденциальности";
const TEXT_LOG = "Логи";
const TEXT_LOGOUT = "Выйти";
const TEXT_TOUR_ROUTE = "Маршрут экскурсии";
const TEXT_ENTER_CODE = "Введите код";
const TEXT_SUPPORT = "Поддержка";
const TEXT_RATE_APP = "Оценить приложение";
const TEXT_AUTH_BY_EMAIL = "Войти через почту";
const TEXT_DESCRIPTION_AUTH_BY_EMAIL =
    "Введите почту, мы вышлем на него код подтверждения";
const TEXT_CODE_VERIFY = "Код подтверждения";
const TEXT_SEND_CODE_VERIFY_PART_1 = "На почту ";
const TEXT_SEND_CODE_VERIFY_PART_2 =
    " был отправлен код подтверждения, введите его";
const TEXT_RESEND_CODE_VERIFY = "Отправить еще раз";
const TEXT_THEME_APP = "Тема приложения";
const TEXT_THEME_LIGHT = "Светлая";
const TEXT_THEME_NIGHT = "Темная";
const TEXT_THEME_SYSTEM = "Как в системе";
const TEXT_FIRST_NAME = "Имя";
const TEXT_LAST_NAME = "Фамилия";
const TEXT_EMAIL = "Почта";
const TEXT_WITHOUT_NAME = "Без имени";

// Buttons
const BUTTON_LOAD_EXCURSION = "Скачать";
const BUTTON_RUN_EXCURSION = "Запустить";
const BUTTON_CONTINUE = "Продолжить";
const BUTTON_VERIFY = "Подтвердить";
const BUTTON_SAVE = "Сохранить";
const BUTTON_START_EXCURSION = "Начать экскурсию";
const BUTTON_SHOW_AR = "Смотреть в AR";

// Placeholders
const PLACEHOLDER_ENTER_EMAIL = "Введите почту";
const PLACEHOLDER_ENTER_FIRST_NAME = "Введите имя";
const PLACEHOLDER_ENTER_LAST_NAME = "Введите фамилию";

// Folders data
const FOLDER_AUDIO = "audios";
const FOLDER_MODELS = "models";

// Notifications
const NOTIFICATION_CONDITIONS_START_TOUR =
    "Для начала экскурсии встаньте возле стартовой метки";
const NOTIFICATION_DEVIATION_ROUTE =
    "Вы отклонились от маршрута, вернитесь или экскурсия будет завершена";
const NOTIFICATION_TERMINATION_DEVIATION_ROUTE =
    "Вы отклонились от маршрута, экскурсия была завершена";

// Distances
const DISTANCE_CONTAINS_START_POINT = 0.015;
const DISTANCE_CONTAINS_WAYPOINT = 0.01;
const DISTANCE_CONTAINS_ROUTE = 0.1;
const DISTANCE_CONTAINS_ROUTE_EXTREME = 0.15;

// Errors
const ERROR_INVALID_EMAIL = "Неверная почта";
const ERROR_SEND_CODE_EMAIL = "Ошибка при отправке кода подтверждения на почту";
const ERROR_CHECK_CODE_VERIFY = "Ошибка при проверке кода подтверждения";
const ERROR_UPDATE_USER = "Ошибка при обновлении даных пользователя";
const ERROR_DRAW_ROUTE = "Ошибка построения маршрута";

// Hive boxes
const HIVE_USER_BOX = "user_box";
const HIVE_EXCURSIONS_BOX = "excursions_box";

// Fields class
const FIELD_EMAIL = "email";
const FIELD_SECRET_CODE = "secret_code";
const FIELD_PHOTO = "photo";
const FIELD_FIRST_NAME = "first_name";
const FIELD_LAST_NAME = "last_name";
const FIELD_ACCESS_TOKEN = "access_token";