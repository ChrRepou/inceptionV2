<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'crepou' );

/** Database password */
define( 'DB_PASSWORD', 'pass' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '!`HBu75o:|dO]Ideo-jC8;_lNIVjJu|zd=X8|]p$B|$Q6 w$}Xazq -7rzqaxyQI');
define('SECURE_AUTH_KEY',  '^Mt=!ib-|=-m;fU&/`S,v,LZ~ j6d>8g&ov&m>h,5;<|_twuxMt{/p:}Sx1J{yMr');
define('LOGGED_IN_KEY',    'F7e2|a>x`7H-0e1.^4TW]lp-j53#`whyI:@w+o/o5P-l/kneA1|l|i1.:/Mg/0_r');
define('NONCE_KEY',        'mDE-xc-{){(+W<P>PaG9q 23;]S&!cSRF=x_75FfSK-V2nzDU&ce}vY6hM+UB45g');
define('AUTH_SALT',        '&,B1LGycc0`#DU|ln|zo Zzsd0msV/aY]F:^&{R/O%BU8+t:1Qx,A8k5WPW,L]uK');
define('SECURE_AUTH_SALT', ' $XMq=VJTsX[AEs|faxC~U;RzqHJFt^lm|Sh]:xv9)Le10@q(66ZrK+o]8>@HlZ,');
define('LOGGED_IN_SALT',   '-j}F+6uEFD-0JP_?iK+M/l/aD[h4_r8pS>++zeDk8 bJ9+.4ha=>D~#Tx|~T?UmE');
define('NONCE_SALT',       'UQ#$*&NA8x)N#_+&^$;Q1V9wIasM+-#q=z[0|jL0v^3-:h7%aZQwSa#&C5 gP3II');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

?>