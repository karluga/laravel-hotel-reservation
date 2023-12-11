<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>
<br>

# Viesnīcas rezervācijas sistēma

## Galvenā funkcionalitāte

### 1. Datu bāzes izveide
   - Izveidojiet datu bāzi, kurā glabāsies informācija par numuriem, to pieejamību, cenām, rezervācijām un klientiem.
   - Katram numuram jābūt unikālam identifikatoram, nosaukumam ("Deluxe Suite"), aprakstam, cenu un pieejamības statusam.

### 2. Numuru saraksta skats
   - Izveidojiet skatu, kas parāda visus pieejamos apartamentus.
   - Lietotājiem jāvar skatīt apartamenta detaļas, piemēram, aprakstu, cenu un attēlus.

### 3. Rezervācijas forma
   - Izveidojiet rezervācijas formu, kur lietotāji var ievadīt savu informāciju (vārdu, e-pastu, tālruņa numuru) un izvēlēties rezervācijas datumus.
   - Kad lietotājs iesniedz formu, veiciet POST pieprasījumu serverim, lai saglabātu rezervāciju datu bāzē.

### 4. Rezervāciju pārskata skats
   - Izveidojiet skatu, kur lietotāji var apskatīt savas esošās rezervācijas.
   - Lietotājiem jāvar rediģēt vai atcelt savas rezervācijas.

### 5. Autentifikācija un autorizācija
   - Nodrošiniet, ka tikai autentificēti lietotāji var veikt rezervācijas.
   - Lietotāji var apskatīt un rediģēt tikai savas rezervācijas.

### 6. Kļūdu pārvaldība
   - Nodrošiniet, ka lietojumprogramma pareizi apstrādā kļūdas, piemēram, servera kļūdas, datu bāzes kļūdas un lietotāja ievades kļūdas.

## Local setup
To get all the dependencies including the `vendor` folder, run this command
```
composer install
```
To generate the app key
```
php artisan key:generate
```
To launch the website on localost
```
php artisan serve
```
IMPORTANT!
Before starting the app, see if the `.env` file has:
- The MySQL database credentials
- Credentials from Gmail SMTP free mail service (from their server)
 - They can be created in your google account.
 - [Google Account](https://myaccount.google.com/) -> Security -> 2-Step Verification (2FA) -> App Passwords
 - Delete the whitespaces from the password before pasting it in the `.env` file.
 - P.S. they let you see it <u>only once!</u>
 - [YT tutorial](https://www.youtube.com/watch?v=1YXVdyVuFGA&ab_channel=Sombex)