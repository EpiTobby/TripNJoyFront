/// COMMON CONSTANTS

const DEFAULT_AVATAR_URL = "https://www.pngkey.com/png/full/115-1150152_default-profile-picture-avatar-png-green.png";
const DEFAULT_GROUP_AVATAR_URL =
    "https://cdn0.iconfinder.com/data/icons/admin-panel-glyph-black/2048/599_-_Subscribers-512.png";
const DEFAULT_IMAGE_URL = "http://cdn.onlinewebfonts.com/svg/img_98811.png";

enum DEFAULT_URL { AVATAR, GROUP, IMAGE }

/// MINIO CONSTANTS

const MINIO_ENDPOINT = String.fromEnvironment('MINIO_ENDPOINT', defaultValue: "127.0.0.1");
const MINIO_ACCESS_KEY = String.fromEnvironment('MINIO_ACCESS_KEY');
const MINIO_SECRET_KEY = String.fromEnvironment('MINIO_SECRET_KEY');
final MINIO_PORT = int.parse(const String.fromEnvironment('MINIO_PORT', defaultValue: '9000'));
const MINIO_BUCKET = String.fromEnvironment('MINIO_BUCKET', defaultValue: 'tripnjoy');

/// BACKGROUND GRADIENT
const BACKGROUND_GRADIENT = "https://wallpapercave.com/wp/wp4411792.jpg";