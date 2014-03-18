SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `tachyon` ;
CREATE SCHEMA IF NOT EXISTS `tachyon` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
SHOW WARNINGS;
USE `tachyon` ;

-- -----------------------------------------------------
-- Table `partner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partner` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `partner` (
  `partner_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL DEFAULT '' COMMENT 'アカウント名' ,
  `company` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '会社名' ,
  `contact` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '担当者' ,
  `contact_in_kana` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '担当者（カナ）' ,
  `mail` VARCHAR(45) NOT NULL DEFAULT '' COMMENT 'メールアドレス' ,
  `telephone` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '電話番号' ,
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT 'ステータス' ,
  `trade_id` VARCHAR(45) NOT NULL DEFAULT '' COMMENT 'DEPRECATED' ,
  `payee_id` INT NULL ,
  `additional_payee_id` INT NULL ,
  `identifier` VARCHAR(45) NOT NULL DEFAULT '' COMMENT 'アカウントID' ,
  `password` CHAR(32) NOT NULL DEFAULT '' COMMENT 'パスワード' ,
  `url` VARCHAR(45) NOT NULL DEFAULT '' COMMENT 'URL' ,
  `remark` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '備考' ,
  `is_intercompany` TINYINT(1) NOT NULL DEFAULT 1 ,
  `greereward_identifier` VARCHAR(10) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NULL COMMENT 'gap_nnnnnn' ,
  `global_partner_id` INT NULL ,
  `is_from_global` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'グローバルから同期されているか' ,
  `is_linkable_to_report` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'リワードレポートのプロモーション別レポートへのリンク生成の可否' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`partner_id`) )
ENGINE = InnoDB
COMMENT = 'パートナー・デベロッパー';

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_identifier` ON `partner` (`identifier` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `media` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `media` (
  `media_id` INT NOT NULL AUTO_INCREMENT ,
  `site_id` INT NOT NULL ,
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'リワード名' ,
  `version` VARCHAR(3) NULL ,
  `identifier` VARCHAR(45) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL DEFAULT '' ,
  `is_approved` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '審査フラグ' ,
  `mode` TINYINT NOT NULL DEFAULT 0 COMMENT '稼動モード' ,
  `margin` DECIMAL(5,4) NOT NULL DEFAULT 0.0000 COMMENT 'メディアマージン' ,
  `payee_id` INT NOT NULL DEFAULT 0 ,
  `additional_margin` DECIMAL(5,4) NOT NULL DEFAULT 0.0000 COMMENT '代理店マージン' ,
  `additional_payee_id` INT NOT NULL DEFAULT 0 ,
  `exchange` DECIMAL(7,4) NULL COMMENT 'ポイントバック率' ,
  `rounding` VARCHAR(5) NOT NULL DEFAULT 'floor' COMMENT 'ポイント計算方法' ,
  `currency` VARCHAR(11) NULL COMMENT '通貨名称' ,
  `currency_unit` VARCHAR(8) NULL COMMENT '通貨単位' ,
  `remark` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '備考' ,
  `callback` VARCHAR(255) NULL COMMENT '成果通知URL' ,
  `role` VARCHAR(32) NOT NULL DEFAULT '' COMMENT '成果通信タイプ' ,
  `is_api_available` TINYINT NOT NULL DEFAULT 0 COMMENT '広告APIの使用可否' ,
  `api_role` VARCHAR(32) NOT NULL DEFAULT 'Default' COMMENT '広告APIのファイル生成タイプ' ,
  `api_priority` TINYINT NOT NULL DEFAULT 0 COMMENT 'XML生成優先するか' ,
  `currency_rate` DECIMAL(7,4) NULL DEFAULT 1.000 COMMENT 'ポイントレート' ,
  `is_show_tutorial` TINYINT NOT NULL DEFAULT 0 COMMENT 'チュートリアル表示有無' ,
  `mail_of_notice` VARCHAR(45) NOT NULL DEFAULT '' COMMENT 'ポイントバックの再送処理失敗時に送信するメールアドレス' ,
  `promote_mail_type` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0:促進メールを送信しない　1:案件情報のみ 2:案件詳細情報含む' ,
  `mail` VARCHAR(45) NOT NULL DEFAULT '' ,
  `media_agency_id` TINYINT NULL COMMENT 'メディア側代理店ID' ,
  `global_media_id` INT NULL ,
  `is_from_global` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'グローバルから同期されているか' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`media_id`) )
ENGINE = InnoDB
COMMENT = 'メディア - site_as_payee';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `advertisement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `advertisement` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `advertisement` (
  `advertisement_id` INT NOT NULL AUTO_INCREMENT ,
  `campaign_id` INT NOT NULL ,
  `identifier` VARCHAR(20) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NOT NULL DEFAULT '' COMMENT 'サンクスID' ,
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'サンクス名' ,
  `requisite_id` INT NOT NULL ,
  `period` TINYINT NOT NULL DEFAULT 0 COMMENT '認証期間' ,
  `offer` INT NOT NULL DEFAULT 0 COMMENT 'グロス単価' ,
  `is_available` TINYINT(1) NOT NULL DEFAULT 1 ,
  `global_advertisement_id` INT NULL ,
  `is_from_global` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'グローバルから同期されているか' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  `identifier_smartc` VARCHAR(32) NULL COMMENT 'Smart-CサンクスID' ,
  PRIMARY KEY (`advertisement_id`) )
ENGINE = InnoDB
COMMENT = 'サンクス';

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_campaign_identifier` ON `advertisement` (`campaign_id` ASC, `identifier` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `campaign`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `campaign` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `campaign` (
  `campaign_id` INT NOT NULL AUTO_INCREMENT ,
  `site_id` INT NOT NULL ,
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'プロモーション名' ,
  `location` VARCHAR(255) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL DEFAULT '' COMMENT 'プロモーションの飛び先' ,
  `start_time` DATETIME NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  `end_time` DATETIME NOT NULL DEFAULT '2020-12-31 23:59:59' ,
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT 'ステータス' ,
  `budget` INT NOT NULL DEFAULT 0 COMMENT '予算' ,
  `budget_is_unlimited` TINYINT NOT NULL DEFAULT 0 COMMENT '予算上限の有無' ,
  `staff` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '社内担当者' ,
  `auth_user_id` INT NULL COMMENT 'プロモーション社内担当者' ,
  `allowance` INT NOT NULL DEFAULT 0 COMMENT '掲載停止残高' ,
  `additional_margin` DECIMAL(5,4) NULL COMMENT '代理店マージン' ,
  `additional_payee_id` INT NULL ,
  `media_margin` DECIMAL(5,4) NULL COMMENT 'メディアマージン' ,
  `draft` TEXT NULL COMMENT '原稿' ,
  `remark` TEXT NULL COMMENT '備考' ,
  `advertisement_id` INT NOT NULL DEFAULT 0 COMMENT '主サンクス' ,
  `identifier` VARCHAR(64) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL DEFAULT '' COMMENT 'サードパーティプロモの識別子' ,
  `is_updatable` TINYINT(1) NULL COMMENT 'サードパーティにより更新可能か' ,
  `reward` INT(11) NULL DEFAULT NULL COMMENT 'インセンティブ上限額（円）' ,
  `weight` TINYINT NOT NULL DEFAULT 0 COMMENT '表示用重み' ,
  `has_banner` TINYINT NOT NULL DEFAULT 0 COMMENT 'インターステイシャルバナー画像' ,
  `market_app_id` VARCHAR(100) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NULL COMMENT 'GreeRewardAsp連携用。Android:パッケージ名, iOS:AppStoreId' ,
  `is_recognize_promote_mail` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0:促進メール送信非承認　1:促進メール送信承認' ,
  `is_ow_publishable` TINYINT(4) NOT NULL DEFAULT 1 COMMENT 'オファーウォール掲載可否のフラグ' ,
  `global_campaign_id` INT NULL ,
  `is_from_global` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'グローバルから同期されているか' ,
  `is_check_publishable` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '0:掲載関係を参照しない　1:掲載関係を参照する' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`campaign_id`) )
ENGINE = InnoDB
COMMENT = 'プロモーション - site_as_payor';

SHOW WARNINGS;
CREATE INDEX `i_identifier` ON `campaign` (`identifier` ASC) ;

SHOW WARNINGS;
CREATE INDEX `i_site` ON `campaign` (`site_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `partner_as_payor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partner_as_payor` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `partner_as_payor` (
  `partner_id` INT(11) NOT NULL ,
  `agency` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '代理店' ,
  `contact` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '代理店担当者' ,
  `contact_in_kana` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '代理店担当者（カナ）' ,
  `staff` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '社内担当者' ,
  `auth_user_id` INT(11) NOT NULL DEFAULT '0' COMMENT 'プロモーション社内担当者' ,
  `remark` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '備考' ,
  `trader_identifier` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '取引先ID' ,
  `trader_contact_identifier` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '取引先担当者ID' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`partner_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'パートナー･クライアントとして';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `partner_as_payee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partner_as_payee` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `partner_as_payee` (
  `partner_id` INT(11) NOT NULL ,
  `agency` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '代理店' ,
  `contact` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '代理店担当者' ,
  `contact_in_kana` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '代理店担当者（カナ）' ,
  `staff` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '社内担当者' ,
  `auth_user_id` INT(11) NOT NULL DEFAULT '0' COMMENT 'リワード社内担当者' ,
  `remark` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '備考' ,
  `bank` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '銀行名' ,
  `branch` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '支店名' ,
  `branch_in_kana` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '支店名（カナ）' ,
  `account_type` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '口座種別・１（普通）・2（当座）' ,
  `account_number` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '口座番号' ,
  `name_in_kana` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '口座名義（カナ）' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`partner_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'パートナー・メディアとして';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `category` (
  `category_id` INT NOT NULL AUTO_INCREMENT ,
  `platform_id` TINYINT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`category_id`) )
ENGINE = InnoDB
COMMENT = 'アプリカテゴリ';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `campaign_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `campaign_category` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `campaign_category` (
  `campaign_id` INT NOT NULL ,
  `category_id` INT NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`campaign_id`, `category_id`) )
ENGINE = InnoDB
COMMENT = 'プロモーションの配信カテゴリ';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `media_campaign`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `media_campaign` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `media_campaign` (
  `media_id` INT NOT NULL ,
  `campaign_id` INT NOT NULL ,
  `is_affiliated` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '掲載するか' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`media_id`, `campaign_id`) )
ENGINE = InnoDB
COMMENT = 'メディアのプロモーション掲載可否設定';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `campaign_media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `campaign_media` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `campaign_media` (
  `campaign_id` INT NOT NULL ,
  `media_id` INT NOT NULL ,
  `is_affiliated` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '掲載するか' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`campaign_id`, `media_id`) )
ENGINE = InnoDB
COMMENT = 'プロモーションのアプリ掲載可否設定';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `media_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `media_category` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `media_category` (
  `media_id` INT NOT NULL ,
  `category_id` INT NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`media_id`, `category_id`) )
ENGINE = InnoDB
COMMENT = 'メディアの掲載カテゴリ';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `campaign_statistic`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `campaign_statistic` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `campaign_statistic` (
  `campaign_id` INT NOT NULL ,
  `spending` INT NOT NULL DEFAULT 0 COMMENT '消化した予算金額' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`campaign_id`) )
ENGINE = InnoDB
COMMENT = 'プロモーションの集計データ（リアルタイム）';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `user` (
  `user_id` INT NOT NULL AUTO_INCREMENT ,
  `model` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '機種' ,
  `identifier` CHAR(64) NOT NULL DEFAULT '' COMMENT 'sha256_hex(固体番号)' ,
  `user_agent` VARCHAR(255) NOT NULL DEFAULT '' ,
  `ip` VARCHAR(15) NOT NULL DEFAULT '' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`user_id`) )
ENGINE = InnoDB
COMMENT = 'ユーザー';

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_identifier` ON `user` (`identifier` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `click`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `click` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `click` (
  `click_id` BIGINT NOT NULL AUTO_INCREMENT ,
  `date` DATE NOT NULL ,
  `media_id` INT NOT NULL ,
  `campaign_id` INT NOT NULL ,
  `user_id` INT NULL ,
  `session` CHAR(40) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NULL ,
  `identifier` VARCHAR(255) NULL COMMENT 'アプリのユーザー識別子' ,
  `user_agent` VARCHAR(255) NOT NULL DEFAULT '' ,
  `ip` VARCHAR(15) NOT NULL DEFAULT '' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`click_id`, `date`) )
ENGINE = InnoDB
COMMENT = 'クリック履歴';

SHOW WARNINGS;
CREATE INDEX `i_campaign_user` ON `click` (`campaign_id` ASC, `user_id` ASC) ;

SHOW WARNINGS;
CREATE INDEX `i_session_campaign` ON `click` (`session` ASC, `campaign_id` ASC) ;

SHOW WARNINGS;
CREATE INDEX `i_media_identifier` ON `click` (`media_id` ASC, `identifier` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `achieve`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `achieve` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `achieve` (
  `achieve_id` CHAR(36) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NOT NULL ,
  `date` DATE NOT NULL ,
  `site_id` INT(11) NOT NULL DEFAULT 0 ,
  `advertisement_identifier` VARCHAR(20) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NOT NULL DEFAULT '' ,
  `identifier` VARCHAR(64) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NOT NULL DEFAULT '' ,
  `session` CHAR(40) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NULL DEFAULT NULL ,
  `click_id` BIGINT NULL DEFAULT NULL ,
  `advertisement_id` INT(11) NOT NULL ,
  `earnings` DECIMAL(9,4) NOT NULL DEFAULT 0.0000 COMMENT '収入' ,
  `additional_earnings` DECIMAL(9,4) NOT NULL DEFAULT 0.0000 ,
  `expenses` DECIMAL(9,4) NOT NULL DEFAULT 0.0000 COMMENT '支出' ,
  `additional_expenses` DECIMAL(9,4) NOT NULL DEFAULT 0.0000 ,
  `user_agent` VARCHAR(255) NOT NULL DEFAULT '' ,
  `ip` VARCHAR(15) NOT NULL DEFAULT '' ,
  `occurred_time` DATETIME NULL DEFAULT NULL COMMENT '初回起動時間' ,
  `traced_time` DATETIME NULL DEFAULT NULL ,
  `is_accepted` TINYINT(1) NULL DEFAULT NULL COMMENT '認証したか' ,
  `accepted_time` DATETIME NULL DEFAULT NULL COMMENT '認証時間' ,
  `point` INT(11) NULL DEFAULT NULL COMMENT '付与ポイント' ,
  `is_forwarded` TINYINT(1) NULL DEFAULT NULL COMMENT 'ポイント・アイテムを付与したか' ,
  `forwarded_time` DATETIME NULL DEFAULT NULL COMMENT 'メディアに成果を通知した時間' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  `user_id` INT(11) NULL DEFAULT NULL ,
  `media_id` INT(11) NULL DEFAULT NULL ,
  `campaign_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`achieve_id`, `date`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '成果履歴';

SHOW WARNINGS;
CREATE INDEX `i_click` ON `achieve` (`click_id` ASC) ;

SHOW WARNINGS;
CREATE INDEX `i_site_identifier` ON `achieve` (`site_id` ASC, `identifier` ASC) ;

SHOW WARNINGS;
CREATE INDEX `i_user_site` ON `achieve` (`user_id` ASC, `site_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `achieve_to_forward`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `achieve_to_forward` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `achieve_to_forward` (
  `achieve_to_forward_id` INT NOT NULL AUTO_INCREMENT ,
  `achieve_id` CHAR(36) NOT NULL ,
  `media_id` INT(11) NULL ,
  `forward_time` TIMESTAMP NULL ,
  `attempted` TINYINT NULL COMMENT '通知失敗回数' ,
  `message` VARCHAR(45) NULL ,
  PRIMARY KEY (`achieve_to_forward_id`) )
ENGINE = InnoDB
COMMENT = '成果履歴（通知待ち）';

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_achieve` ON `achieve_to_forward` (`achieve_id` ASC) ;

SHOW WARNINGS;
CREATE INDEX `i_forward_time` ON `achieve_to_forward` (`forward_time` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `report` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `report` (
  `report_id` BIGINT NOT NULL AUTO_INCREMENT ,
  `date` DATE NOT NULL ,
  `media_id` INT NOT NULL ,
  `campaign_id` INT NOT NULL ,
  `view` INT NOT NULL DEFAULT 0 ,
  `click` INT NOT NULL DEFAULT 0 ,
  `achieve` INT NOT NULL DEFAULT 0 ,
  `earnings` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 COMMENT '収入' ,
  `additional_earnings` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 ,
  `expenses` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 COMMENT '支出（メディア分）' ,
  `additional_expenses` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 COMMENT '支出（代理店分）' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`report_id`) )
ENGINE = InnoDB
COMMENT = 'レポート';

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_date_media_campaign` ON `report` (`date` ASC, `media_id` ASC, `campaign_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `site`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `site` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `site` (
  `site_id` INT NOT NULL AUTO_INCREMENT ,
  `partner_id` INT NOT NULL ,
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'アプリ名' ,
  `app_id` VARCHAR(255) CHARACTER SET 'latin1' NULL ,
  `identifier` VARCHAR(64) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL DEFAULT '' ,
  `url` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'アプリのURL' ,
  `price` INT NOT NULL DEFAULT 0 ,
  `version_in_review` VARCHAR(16) NULL ,
  `subscription_duration` SMALLINT NOT NULL DEFAULT 0 COMMENT '0:買切り;30:月額' ,
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT 'ステータス' ,
  `is_monthly_unique` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '成果重複チェック：0:全期間;1:月間' ,
  `supplier_id` TINYINT NOT NULL ,
  `platform_id` TINYINT NOT NULL ,
  `market_id` TINYINT NULL ,
  `network_id` TINYINT NULL ,
  `category_id` INT NOT NULL DEFAULT 0 ,
  `has_icon` TINYINT(1) NOT NULL DEFAULT 0 ,
  `description` TEXT NULL ,
  `cipher` BINARY(16) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0' COMMENT '暗号鍵' ,
  `carrier_pointplusmobile` INT NULL ,
  `tracking_method` TINYINT NOT NULL DEFAULT 0 ,
  `uri` VARCHAR(255) NOT NULL DEFAULT '' ,
  `package` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'パッケージネーム' ,
  `priority` TINYINT NOT NULL DEFAULT 0 ,
  `deny_browser` TINYINT NOT NULL DEFAULT 0 ,
  `global_site_id` INT NULL ,
  `is_from_global` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'グローバルから同期されているか' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`site_id`) )
ENGINE = InnoDB
COMMENT = 'アプリ';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `report_by_advertisement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `report_by_advertisement` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `report_by_advertisement` (
  `report_by_advertisement_id` INT NOT NULL AUTO_INCREMENT ,
  `date` DATE NOT NULL ,
  `media_id` INT NOT NULL ,
  `advertisement_id` INT NOT NULL ,
  `achieve` INT NOT NULL DEFAULT 0 ,
  `earnings` DECIMAL(11,4) NOT NULL DEFAULT 0.0000 ,
  `additional_earnings` DECIMAL(11,4) NOT NULL DEFAULT 0.0000 ,
  `expenses` DECIMAL(11,4) NOT NULL DEFAULT 0.0000 ,
  `additional_expenses` DECIMAL(11,4) NOT NULL DEFAULT 0.0000 ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`report_by_advertisement_id`) )
ENGINE = InnoDB
COMMENT = 'レポート・サンクス別';

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_date_media_campaign` ON `report_by_advertisement` (`date` ASC, `media_id` ASC, `advertisement_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `requisite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `requisite` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `requisite` (
  `requisite_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `is_forward` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`requisite_id`) )
ENGINE = InnoDB
COMMENT = 'サンクスカテゴリ';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `item_of_click`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `item_of_click` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `item_of_click` (
  `click_id` INT NOT NULL ,
  `identifier` VARCHAR(45) NOT NULL DEFAULT '' ,
  `price` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`click_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `platform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platform` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `platform` (
  `platform_id` TINYINT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(9) NOT NULL ,
  PRIMARY KEY (`platform_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `platform_compatibility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platform_compatibility` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `platform_compatibility` (
  `platform_id_of_media` TINYINT NOT NULL COMMENT 'platform_id' ,
  `platform_id_of_campaign` TINYINT NOT NULL COMMENT 'platform_id' ,
  PRIMARY KEY (`platform_id_of_media`, `platform_id_of_campaign`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `supplier` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `supplier` (
  `supplier_id` TINYINT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(32) NOT NULL ,
  `role` VARCHAR(15) NULL ,
  PRIMARY KEY (`supplier_id`) )
ENGINE = InnoDB
COMMENT = 'アプリ（プロモ）の提供元';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `media_platform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `media_platform` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `media_platform` (
  `media_id` INT NOT NULL ,
  `platform_id` TINYINT NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`media_id`, `platform_id`) )
ENGINE = InnoDB
COMMENT = 'メディアの掲載プラットフォーム';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `media_supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `media_supplier` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `media_supplier` (
  `media_id` INT NOT NULL ,
  `supplier_id` TINYINT NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`media_id`, `supplier_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `analytics_continent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `analytics_continent` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `analytics_continent` (
  `analytics_continent_id` TINYINT NOT NULL AUTO_INCREMENT ,
  `code` CHAR(2) NOT NULL ,
  `name` VARCHAR(13) NOT NULL ,
  PRIMARY KEY (`analytics_continent_id`) )
ENGINE = InnoDB
COMMENT = '大陸';

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_code` ON `analytics_continent` (`code` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `analytics_country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `analytics_country` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `analytics_country` (
  `analytics_country_id` SMALLINT NOT NULL AUTO_INCREMENT ,
  `analytics_continent_id` TINYINT NOT NULL ,
  `code` CHAR(2) NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`analytics_country_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `i_analytics_continent` ON `analytics_country` (`analytics_continent_id` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_code` ON `analytics_country` (`code` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `analytics_region`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `analytics_region` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `analytics_region` (
  `analytics_region_id` SMALLINT NOT NULL AUTO_INCREMENT ,
  `analytics_country_id` SMALLINT NOT NULL ,
  `code` VARCHAR(3) NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`analytics_region_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_analytics_country_code` ON `analytics_region` (`analytics_country_id` ASC, `code` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `analytics_city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `analytics_city` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `analytics_city` (
  `analytics_city_id` MEDIUMINT NOT NULL AUTO_INCREMENT ,
  `analytics_region_id` SMALLINT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`analytics_city_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_analytics_region_name` ON `analytics_city` (`analytics_region_id` ASC, `name` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `market`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `market` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `market` (
  `market_id` TINYINT NOT NULL ,
  `platform_id` TINYINT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `refund_period` MEDIUMINT NOT NULL DEFAULT 0 COMMENT '返品期限（秒）' ,
  PRIMARY KEY (`market_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `carrier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `carrier` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `carrier` (
  `carrier_id` TINYINT NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`carrier_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `market_compatibility`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `market_compatibility` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `market_compatibility` (
  `market_id` TINYINT NOT NULL ,
  `carrier_id` TINYINT NOT NULL ,
  PRIMARY KEY (`market_id`, `carrier_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `analytics_isp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `analytics_isp` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `analytics_isp` (
  `analytics_isp_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`analytics_isp_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `name_UNIQUE` ON `analytics_isp` (`name` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `role` (
  `role_id` INT NOT NULL AUTO_INCREMENT ,
  `role` TEXT NOT NULL ,
  PRIMARY KEY (`role_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `partner_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partner_role` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `partner_role` (
  `partner_id` INT NOT NULL ,
  `role_id` INT NOT NULL ,
  PRIMARY KEY (`partner_id`, `role_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `analytics_receipt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `analytics_receipt` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `analytics_receipt` (
  `analytics_receipt_id` INT NOT NULL AUTO_INCREMENT ,
  `date` DATETIME NOT NULL ,
  `site_id` INT NOT NULL ,
  `transaction` VARCHAR(128) NOT NULL ,
  `price` DECIMAL(11,2) NOT NULL COMMENT '合計金額' ,
  `currency_id` CHAR(3) NOT NULL ,
  `analytics_country_id` INT NOT NULL ,
  `user_id` INT NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`analytics_receipt_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_site_transaction` ON `analytics_receipt` (`site_id` ASC, `transaction` ASC) ;

SHOW WARNINGS;
CREATE INDEX `i_user_id` ON `analytics_receipt` (`user_id` ASC) ;

SHOW WARNINGS;
CREATE INDEX `i_site_date` ON `analytics_receipt` (`date` ASC, `site_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `analytics_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `analytics_product` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `analytics_product` (
  `analytics_product_id` INT NOT NULL AUTO_INCREMENT ,
  `site_id` INT NOT NULL ,
  `identifier` VARCHAR(128) NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`analytics_product_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_site_identifier` ON `analytics_product` (`site_id` ASC, `identifier` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `currency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `currency` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `currency` (
  `currency_id` CHAR(3) NOT NULL COMMENT 'i.e. USD' ,
  `name` VARCHAR(45) NOT NULL COMMENT 'i.e. USドル' ,
  `symbol` VARCHAR(4) NOT NULL COMMENT 'i.e. $' ,
  PRIMARY KEY (`currency_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `exchange`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exchange` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `exchange` (
  `quote` CHAR(3) NOT NULL ,
  `base` CHAR(3) NOT NULL ,
  `rate` DECIMAL(13,9) NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`quote`, `base`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `analytics_receipt_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `analytics_receipt_item` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `analytics_receipt_item` (
  `analytics_receipt_item_id` INT NOT NULL AUTO_INCREMENT ,
  `analytics_receipt_id` INT NOT NULL ,
  `analytics_product_id` INT NOT NULL ,
  `quantity` INT NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`analytics_receipt_item_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_receipt_product` ON `analytics_receipt_item` (`analytics_receipt_id` ASC, `analytics_product_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `partner_setting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partner_setting` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `partner_setting` (
  `partner_setting_id` INT NOT NULL AUTO_INCREMENT ,
  `currency` CHAR(3) NULL ,
  `language` CHAR(2) NULL ,
  `timezone` TINYINT NULL ,
  PRIMARY KEY (`partner_setting_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `analytics_receipt_price_level`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `analytics_receipt_price_level` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `analytics_receipt_price_level` (
  `analytics_receipt_price_level_id` INT NOT NULL AUTO_INCREMENT ,
  `currency_id` CHAR(3) NULL ,
  `name` VARCHAR(45) NULL ,
  `min` INT NULL ,
  PRIMARY KEY (`analytics_receipt_price_level_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `i_currency` ON `analytics_receipt_price_level` (`currency_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `analytics_receipt_num_level`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `analytics_receipt_num_level` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `analytics_receipt_num_level` (
  `analytics_receipt_num_level_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `min` INT NULL ,
  PRIMARY KEY (`analytics_receipt_num_level_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cache`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cache` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `cache` (
  `id` CHAR(36) NOT NULL ,
  `cache_data` TEXT NULL ,
  `expires` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'キャッシュ・システム用';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `media_alternative_to_partner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `media_alternative_to_partner` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `media_alternative_to_partner` (
  `media_id` INT NOT NULL ,
  `partner_id` INT NOT NULL ,
  `margin` DECIMAL(5,4) NOT NULL DEFAULT 0.0000 ,
  `additional_margin` DECIMAL(5,4) NOT NULL DEFAULT 0.0000 ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`media_id`, `partner_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `alternative`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alternative` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `alternative` (
  `advertisement_id` INT NOT NULL ,
  `offer` INT NOT NULL DEFAULT 0 ,
  `media_id` INT NOT NULL ,
  `margin` DECIMAL(5,4) NOT NULL DEFAULT 0.0000 ,
  `additional_margin` DECIMAL(5,4) NOT NULL DEFAULT 0.0000 ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`advertisement_id`, `media_id`) )
ENGINE = InnoDB
COMMENT = '出稿単価×媒体料率一覧';

SHOW WARNINGS;
CREATE INDEX `i_media` ON `alternative` (`media_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payment` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `payment` (
  `date` DATE NOT NULL ,
  `payee_id` INT NOT NULL ,
  `balance` DECIMAL(9,4) NOT NULL DEFAULT 0.0000 ,
  `amount` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`date`, `payee_id`) )
ENGINE = InnoDB
COMMENT = '支払データ';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `payee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payee` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `payee` (
  `payee_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL DEFAULT '' ,
  `means` TINYINT NOT NULL DEFAULT 1 COMMENT '支払方法：1（銀行振込）' ,
  `bank_name` VARCHAR(35) NOT NULL DEFAULT '' COMMENT '銀行名' ,
  `branch_name` VARCHAR(15) NOT NULL DEFAULT '' COMMENT '支店名' ,
  `account_type` TINYINT NOT NULL DEFAULT 1 COMMENT '口座種別：1（普通）2（当座）' ,
  `account_number` VARCHAR(7) NOT NULL DEFAULT '' ,
  `account_name_in_kana` VARCHAR(45) NOT NULL DEFAULT '' ,
  `remark` TEXT NULL ,
  `global_payee_id` INT NULL ,
  `is_from_global` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'グローバルから同期されているか' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`payee_id`) )
ENGINE = InnoDB
COMMENT = '支払先';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `charge`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `charge` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `charge` (
  `date` DATE NOT NULL ,
  `advertisement_id` INT NOT NULL ,
  `offer` DECIMAL(9,4) NOT NULL ,
  `amount` INT NOT NULL DEFAULT 0 ,
  `earnings` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 ,
  `expenses` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 ,
  `additional_expenses` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`date`, `advertisement_id`, `offer`) )
ENGINE = InnoDB
COMMENT = '請求データ';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `achieve_proxy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `achieve_proxy` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `achieve_proxy` (
  `achieve_proxy_id` INT NOT NULL AUTO_INCREMENT ,
  `query_params` TEXT NULL ,
  `forward_time` TIMESTAMP NULL ,
  `attempted` INT NULL DEFAULT 0 ,
  `status` TINYINT NOT NULL DEFAULT 0 ,
  `message` VARCHAR(45) NULL ,
  PRIMARY KEY (`achieve_proxy_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `network`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `network` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `network` (
  `network_id` TINYINT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`network_id`) )
ENGINE = InnoDB
COMMENT = 'openfeint, plus+, GREE Platform for smartphone and etc.';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `distributor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `distributor` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `distributor` (
  `distributor_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(16) NOT NULL ,
  `role` VARCHAR(32) NULL ,
  PRIMARY KEY (`distributor_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `campaign_distributor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `campaign_distributor` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `campaign_distributor` (
  `campaign_id` INT NOT NULL ,
  `distributor_id` INT NOT NULL ,
  `identifier` VARCHAR(45) NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`campaign_id`, `distributor_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `preference`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `preference` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `preference` (
  `name` VARCHAR(10) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NOT NULL DEFAULT '' COMMENT '機能名' ,
  `value` VARCHAR(10) NULL COMMENT '設定値' ,
  PRIMARY KEY (`name`) )
ENGINE = InnoDB
COMMENT = '各種設定値';

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_campaign_identifier` ON `preference` (`name` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `media_alternative_to_advertisement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `media_alternative_to_advertisement` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `media_alternative_to_advertisement` (
  `media_id` INT NOT NULL ,
  `advertisement_id` INT NOT NULL ,
  `margin` DECIMAL(5,4) NOT NULL DEFAULT 0.0000 ,
  `additional_margin` DECIMAL(5,4) NOT NULL DEFAULT 0.0000 ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`media_id`, `advertisement_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `auth_user_page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auth_user_page` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `auth_user_page` (
  `auth_user_id` INT(11) NOT NULL ,
  `auth_page_id` INT(11) NOT NULL ,
  `auth_role_id` INT(11) NOT NULL ,
  PRIMARY KEY (`auth_user_id`, `auth_page_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `auth_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auth_user` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `auth_user` (
  `auth_user_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `auth_group_id` INT(11) NOT NULL ,
  `account` VARCHAR(128) NOT NULL ,
  `fullname` VARCHAR(32) NOT NULL ,
  `mail` VARCHAR(128) NULL ,
  `del_flg` TINYINT(4) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`auth_user_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 124
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idx_account` USING BTREE ON `auth_user` (`account` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `auth_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auth_role` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `auth_role` (
  `auth_role_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `role_name` VARCHAR(32) NOT NULL ,
  PRIMARY KEY (`auth_role_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idx_role_name` USING BTREE ON `auth_role` (`role_name` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `auth_page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auth_page` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `auth_page` (
  `auth_page_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `page_name` VARCHAR(255) NOT NULL ,
  `url` VARCHAR(255) NOT NULL ,
  `privacy` TINYINT(4) NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`auth_page_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 44
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idx_url` USING BTREE ON `auth_page` (`url` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `auth_group_page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auth_group_page` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `auth_group_page` (
  `auth_group_id` INT(11) NOT NULL ,
  `auth_page_id` INT(11) NOT NULL ,
  `auth_role_id` INT(11) NOT NULL ,
  PRIMARY KEY (`auth_group_id`, `auth_page_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `auth_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auth_group` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `auth_group` (
  `auth_group_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `group_name` VARCHAR(32) NOT NULL ,
  PRIMARY KEY (`auth_group_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

SHOW WARNINGS;
CREATE INDEX `group_name` USING BTREE ON `auth_group` (`group_name` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `menu` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `menu` (
  `menu_id` TINYINT NOT NULL AUTO_INCREMENT ,
  `type` VARCHAR(9) NOT NULL ,
  `name` VARCHAR(13) NOT NULL ,
  `description` VARCHAR(102) NOT NULL DEFAULT '' ,
  `role` VARCHAR(32) NULL COMMENT '案件取得の条件設定' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`menu_id`) )
ENGINE = InnoDB
COMMENT = 'リワードのユーザー向けメニュー';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `media_menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `media_menu` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `media_menu` (
  `media_id` INT NOT NULL ,
  `position` TINYINT NOT NULL ,
  `menu_id` TINYINT NOT NULL ,
  `is_use_original_img` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0:使用しない 1:使用する' ,
  `url` VARCHAR(255) NULL ,
  `url_role` VARCHAR(32) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`media_id`, `position`) )
ENGINE = InnoDB
COMMENT = 'メディアごとのメニュー設定';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `campaign_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `campaign_history` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `campaign_history` (
  `campaign_history_id` INT NOT NULL AUTO_INCREMENT ,
  `updated_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  `campaign_id` INT NOT NULL ,
  `auth_user_id` INT NOT NULL ,
  `budget` INT NULL DEFAULT NULL ,
  `allowance` INT NULL DEFAULT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`campaign_history_id`) )
ENGINE = InnoDB
COMMENT = '予算変更履歴';

SHOW WARNINGS;
CREATE INDEX `i_campaign` ON `campaign_history` (`campaign_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `compensation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `compensation` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `compensation` (
  `compensation_id` INT NOT NULL AUTO_INCREMENT ,
  `auth_user_id` INT(11) NOT NULL ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`compensation_id`) )
ENGINE = InnoDB
COMMENT = '補填情報';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `compensation_job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `compensation_job` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `compensation_job` (
  `compensation_job_id` INT NOT NULL AUTO_INCREMENT ,
  `compensation_id` INT NOT NULL ,
  `media_id` INT NOT NULL ,
  `identifier` VARCHAR(255) NOT NULL ,
  `campaign_id` INT NOT NULL ,
  `advertisement_identifier` VARCHAR(20) NOT NULL ,
  `status` TINYINT NULL DEFAULT NULL COMMENT 'NULL:未処理 0:失敗 1:処理済' ,
  `achieve_id` VARCHAR(45) NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`compensation_job_id`) )
ENGINE = InnoDB
COMMENT = '補填ジョブ情報';

SHOW WARNINGS;
CREATE INDEX `i_compensation` ON `compensation_job` (`compensation_id` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_media_identifier_campaign_advertisement` ON `compensation_job` (`media_id` ASC, `identifier` ASC, `campaign_id` ASC, `advertisement_identifier` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `job` (
  `target_id` INT NOT NULL ,
  `role` VARCHAR(32) NOT NULL ,
  `priority` TINYINT NOT NULL ,
  `execute_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`target_id`, `role`) )
ENGINE = InnoDB
COMMENT = 'ジョブキュー';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tag_client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag_client` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `tag_client` (
  `tag_client_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL DEFAULT '' COMMENT 'クライアント名' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`tag_client_id`) )
ENGINE = InnoDB
COMMENT = 'クライアント';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tag_site`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag_site` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `tag_site` (
  `tag_site_id` INT NOT NULL AUTO_INCREMENT ,
  `tag_client_id` INT NULL ,
  `name` VARCHAR(255) NULL DEFAULT '' COMMENT 'サイト名' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`tag_site_id`) )
ENGINE = InnoDB
COMMENT = '<double-click to overwrite multiple objects>';

SHOW WARNINGS;
CREATE INDEX `i_tag_client` ON `tag_site` (`tag_client_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tag_page`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag_page` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `tag_page` (
  `tag_page_id` INT NOT NULL AUTO_INCREMENT ,
  `tag_site_id` INT NOT NULL ,
  `name` VARCHAR(255) NULL DEFAULT '' COMMENT 'ページ名' ,
  `use_appdriver` TINYINT NULL DEFAULT NULL COMMENT '0:normal,1:via appdriver' ,
  `redirect` VARCHAR(255) NULL DEFAULT NULL COMMENT '遷移先URL' ,
  `file_name` VARCHAR(69) NULL DEFAULT NULL ,
  `paste_url` VARCHAR(255) NULL DEFAULT NULL ,
  `paste_data` TEXT NULL DEFAULT NULL ,
  `design` TINYINT NULL DEFAULT NULL COMMENT '0:white,1:LP' ,
  `body_code` TEXT NULL DEFAULT NULL COMMENT 'bodyのコード' ,
  `campaign_id` INT NULL DEFAULT NULL COMMENT 'appdriverのcampaign_id' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`tag_page_id`) )
ENGINE = InnoDB
COMMENT = '<double-click to overwrite multiple objects>';

SHOW WARNINGS;
CREATE INDEX `i_tag_site` ON `tag_page` (`tag_site_id` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_file_name` ON `tag_page` (`file_name` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `logcheck`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logcheck` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `logcheck` (
  `logcheck_id` INT NOT NULL AUTO_INCREMENT ,
  `date` DATE NOT NULL ,
  `auth_user_id` INT(11) NOT NULL ,
  `site_id` INT NOT NULL ,
  `params` VARCHAR(255) NULL ,
  `role` VARCHAR(32) NOT NULL ,
  `status` TINYINT NULL COMMENT '0:未処理 1:処理完了 2:削除済' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`logcheck_id`) )
ENGINE = InnoDB
COMMENT = 'ログチェック情報';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `payment_for_campaign`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payment_for_campaign` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `payment_for_campaign` (
  `date` DATE NOT NULL ,
  `campaign_id` INT NOT NULL ,
  `additional_payee_id` INT NULL ,
  `additional_earnings` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`date`, `campaign_id`) )
ENGINE = InnoDB
COMMENT = '支払データ';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `payment_for_partner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `payment_for_partner` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `payment_for_partner` (
  `date` DATE NOT NULL ,
  `partner_id` INT NOT NULL ,
  `payee_id` INT NULL ,
  `expenses` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 ,
  `additional_payee_id` INT NULL ,
  `additional_expenses` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`date`, `partner_id`) )
ENGINE = InnoDB
COMMENT = '支払データ';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `alternative_job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alternative_job` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `alternative_job` (
  `alternative_job_id` INT NOT NULL AUTO_INCREMENT ,
  `partner_id` INT NULL DEFAULT NULL ,
  `site_id` INT NULL DEFAULT NULL ,
  `campaign_id` INT NULL DEFAULT NULL ,
  `advertisement_id` INT NULL DEFAULT NULL ,
  `media_id` INT NULL DEFAULT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`alternative_job_id`) )
ENGINE = InnoDB
COMMENT = 'alternativeジョブ情報';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `exception_media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `exception_media` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `exception_media` (
  `media_id` INT NOT NULL ,
  `expire` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`media_id`) )
ENGINE = InnoDB
COMMENT = 'ポイントバック除外メディア';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cross_campaign`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cross_campaign` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `cross_campaign` (
  `cross_campaign_id` INT NOT NULL AUTO_INCREMENT ,
  `site_id` INT NOT NULL ,
  `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'クロスプロモ名' ,
  `location` VARCHAR(255) CHARACTER SET 'latin1' COLLATE 'latin1_general_ci' NOT NULL DEFAULT '' COMMENT 'プロモーションの飛び先' ,
  `start_time` DATETIME NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  `end_time` DATETIME NOT NULL DEFAULT '2020-12-31 23:59:59' ,
  `status` TINYINT NOT NULL DEFAULT 0 COMMENT 'ステータス' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`cross_campaign_id`) )
ENGINE = InnoDB
COMMENT = 'クロスプロモーション';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cross_media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cross_media` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `cross_media` (
  `cross_media_id` INT NOT NULL AUTO_INCREMENT ,
  `media_id` INT NOT NULL ,
  `type` SET('wall','splash') NOT NULL DEFAULT '' COMMENT 'クロスプロモ名' ,
  PRIMARY KEY (`cross_media_id`) )
ENGINE = InnoDB
COMMENT = 'クロスプメディア';

SHOW WARNINGS;
CREATE INDEX `i_media` ON `cross_media` (`media_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cross_campaign_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cross_campaign_category` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `cross_campaign_category` (
  `cross_campaign_id` INT NOT NULL ,
  `category_id` INT NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`cross_campaign_id`, `category_id`) )
ENGINE = InnoDB
COMMENT = 'クロスプロモーションの配信カテゴリ';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cross_campaign_cross_media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cross_campaign_cross_media` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `cross_campaign_cross_media` (
  `cross_campaign_id` INT NOT NULL ,
  `cross_media_id` INT NOT NULL ,
  `is_affiliated` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '掲載するか' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`cross_campaign_id`, `cross_media_id`) )
ENGINE = InnoDB
COMMENT = 'クロスプロモーションのアプリ掲載可否設定';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cross_media_cross_campaign`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cross_media_cross_campaign` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `cross_media_cross_campaign` (
  `cross_media_id` INT NOT NULL ,
  `cross_campaign_id` INT NOT NULL ,
  `is_affiliated` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '掲載するか' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`cross_media_id`, `cross_campaign_id`) )
ENGINE = InnoDB
COMMENT = 'メディアのクロスプロモーション掲載可否設定';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `stock_impression_of_offer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stock_impression_of_offer` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `stock_impression_of_offer` (
  `campaign_id` INT NOT NULL ,
  `date` DATE NOT NULL ,
  `default_impression` INT NOT NULL ,
  `stock_impression` INT NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`campaign_id`, `date`) )
ENGINE = InnoDB
COMMENT = '入札枠在庫imp数';

SHOW WARNINGS;
CREATE INDEX `i_date` ON `stock_impression_of_offer` (`date` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `stock_impression`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stock_impression` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `stock_impression` (
  `cross_campaign_id` INT NOT NULL ,
  `date` DATE NOT NULL ,
  `cross_media_id` INT NOT NULL ,
  `stock_impression` INT NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`cross_campaign_id`, `date`, `cross_media_id`) )
ENGINE = InnoDB
COMMENT = 'クロスプロモ枠在庫imp数';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `impression`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impression` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `impression` (
  `cross_media_id` INT NOT NULL ,
  `date` DATE NOT NULL ,
  `wall_id` INT NOT NULL ,
  `impression` INT NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`cross_media_id`, `date`, `wall_id`) )
ENGINE = InnoDB
COMMENT = 'クロスプロモimp数';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `click_of_crosswall`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `click_of_crosswall` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `click_of_crosswall` (
  `click_of_crosswall_id` BIGINT NOT NULL AUTO_INCREMENT ,
  `date` DATE NOT NULL ,
  `cross_media_id` INT NOT NULL ,
  `cross_campaign_id` INT NOT NULL ,
  `identifier` VARCHAR(255) NULL COMMENT 'アプリのユーザー識別子' ,
  `user_agent` VARCHAR(255) NOT NULL DEFAULT '' ,
  `ip` VARCHAR(15) NOT NULL DEFAULT '' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`click_of_crosswall_id`, `date`) )
ENGINE = InnoDB
COMMENT = 'クリック履歴';

SHOW WARNINGS;
CREATE INDEX `i_media_identifier` ON `click_of_crosswall` (`cross_media_id` ASC, `identifier` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `report_by_wall`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `report_by_wall` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `report_by_wall` (
  `report_id` BIGINT NOT NULL AUTO_INCREMENT ,
  `date` DATE NOT NULL ,
  `media_id` INT NOT NULL ,
  `campaign_id` INT NOT NULL ,
  `wall_id` INT NOT NULL ,
  `view` INT NOT NULL DEFAULT 0 ,
  `click` INT NOT NULL DEFAULT 0 ,
  `achieve` INT NOT NULL DEFAULT 0 ,
  `earnings` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 COMMENT '収入' ,
  `additional_earnings` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 ,
  `expenses` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 COMMENT '支出（メディア分）' ,
  `additional_expenses` DECIMAL(13,4) NOT NULL DEFAULT 0.0000 COMMENT '支出（代理店分）' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`report_id`) )
ENGINE = InnoDB
COMMENT = 'レポート・ウォール別';

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_date_media_campaign_wall` ON `report_by_wall` (`date` ASC, `media_id` ASC, `campaign_id` ASC, `wall_id` ASC) ;

SHOW WARNINGS;
CREATE INDEX `i_campaign` ON `report_by_wall` (`campaign_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `report_of_crosswall`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `report_of_crosswall` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `report_of_crosswall` (
  `report_id` INT NOT NULL AUTO_INCREMENT ,
  `date` DATE NOT NULL ,
  `cross_media_id` INT NOT NULL ,
  `cross_campaign_id` INT NOT NULL ,
  `impression` INT NOT NULL DEFAULT 0 ,
  `stock_impression` INT NOT NULL DEFAULT 0 COMMENT '配信imp' ,
  `click` INT NOT NULL DEFAULT 0 ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`report_id`) )
ENGINE = InnoDB
COMMENT = 'クロスプロモーションレポート';

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_date_media_campaign` ON `report_of_crosswall` (`date` ASC, `cross_media_id` ASC, `cross_campaign_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `achieve_to_forward_backup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `achieve_to_forward_backup` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `achieve_to_forward_backup` (
  `achieve_to_forward_id` INT NOT NULL AUTO_INCREMENT ,
  `achieve_id` CHAR(36) NOT NULL ,
  `forward_time` TIMESTAMP NULL ,
  `attempted` TINYINT NULL COMMENT '通知失敗回数' ,
  `message` VARCHAR(45) NULL ,
  PRIMARY KEY (`achieve_to_forward_id`) )
ENGINE = InnoDB
COMMENT = '成果履歴（通知待ちで再送回数が上限に達したもの）';

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_achieve` ON `achieve_to_forward_backup` (`achieve_id` ASC) ;

SHOW WARNINGS;
CREATE INDEX `i_forward_time` ON `achieve_to_forward_backup` (`forward_time` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `alternative_of_crosswall`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alternative_of_crosswall` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `alternative_of_crosswall` (
  `cross_campaign_id` INT NOT NULL ,
  `cross_media_id` INT NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`cross_campaign_id`, `cross_media_id`) )
ENGINE = InnoDB
COMMENT = 'クロスプロモ掲載';

SHOW WARNINGS;
CREATE INDEX `i_cross_media` ON `alternative_of_crosswall` (`cross_media_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `alternative_of_crosswall_job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alternative_of_crosswall_job` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `alternative_of_crosswall_job` (
  `alternative_of_crosswall_job_id` INT NOT NULL AUTO_INCREMENT ,
  `partner_id` INT NULL DEFAULT NULL ,
  `site_id` INT NULL DEFAULT NULL ,
  `cross_campaign_id` INT NULL DEFAULT NULL ,
  `cross_media_id` INT NULL DEFAULT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`alternative_of_crosswall_job_id`) )
ENGINE = InnoDB
COMMENT = 'alternative_of_crosswallジョブ情報';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `stock_impression_job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stock_impression_job` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `stock_impression_job` (
  `stock_impression_job_id` INT NOT NULL AUTO_INCREMENT ,
  `cross_campaign_id` INT NULL DEFAULT NULL ,
  `cross_media_id` INT NULL DEFAULT NULL ,
  `target_date` DATE NULL DEFAULT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`stock_impression_job_id`) )
ENGINE = InnoDB
COMMENT = 'stock_impressionジョブ情報';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `impression_of_offer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impression_of_offer` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `impression_of_offer` (
  `campaign_id` INT NOT NULL ,
  `date` DATE NOT NULL ,
  `wall_id` INT NOT NULL ,
  `impression` INT NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`campaign_id`, `date`, `wall_id`) )
ENGINE = InnoDB
COMMENT = '入札枠imp数';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `stock_impression_of_offer_job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stock_impression_of_offer_job` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `stock_impression_of_offer_job` (
  `stock_impression_of_offer_job_id` INT NOT NULL AUTO_INCREMENT ,
  `campaign_id` INT NULL DEFAULT NULL ,
  `target_date` DATE NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`stock_impression_of_offer_job_id`) )
ENGINE = InnoDB
COMMENT = 'stock_impression_of_offerジョブ情報';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `click_of_wall`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `click_of_wall` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `click_of_wall` (
  `click_id` BIGINT NOT NULL ,
  `date` DATE NOT NULL ,
  `wall_id` INT NOT NULL ,
  PRIMARY KEY (`click_id`, `date`) )
ENGINE = InnoDB
COMMENT = 'クリック履歴';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `wall`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wall` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `wall` (
  `wall_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(16) NOT NULL ,
  PRIMARY KEY (`wall_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `stock_impression_of_partner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `stock_impression_of_partner` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `stock_impression_of_partner` (
  `partner_id` INT NOT NULL ,
  `stock_impression` INT NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`partner_id`) )
ENGINE = InnoDB
COMMENT = 'クロスプロモ枠在庫imp数';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `advertisement_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `advertisement_history` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `advertisement_history` (
  `advertisement_history_id` INT NOT NULL AUTO_INCREMENT ,
  `advertisement_id` INT NOT NULL ,
  `auth_user_id` INT NOT NULL ,
  `offer` INT NULL DEFAULT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`advertisement_history_id`) )
ENGINE = InnoDB
COMMENT = 'グロス単価変更履歴';

SHOW WARNINGS;
CREATE INDEX `i_advertisement` ON `advertisement_history` (`advertisement_id` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `map_by_cookie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `map_by_cookie` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `map_by_cookie` (
  `cookie_identifier` VARCHAR(64) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NOT NULL ,
  `site_id` INT NOT NULL ,
  `date` DATE NOT NULL ,
  `identifier` VARCHAR(64) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NOT NULL COMMENT 'identifier of first achieve' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`cookie_identifier`, `site_id`, `date`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'map data from cookie identifier';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `map_by_identifier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `map_by_identifier` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `map_by_identifier` (
  `subsequent_identifier` VARCHAR(64) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NOT NULL ,
  `site_id` INT NOT NULL ,
  `date` DATE NOT NULL ,
  `identifier` VARCHAR(64) CHARACTER SET 'ascii' COLLATE 'ascii_general_ci' NOT NULL COMMENT 'identifier of first achieve' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`subsequent_identifier`, `site_id`, `date`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'map data from subsequent identifier';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `user_agent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_agent` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `user_agent` (
  `user_agent_id` INT NOT NULL AUTO_INCREMENT ,
  `model` VARCHAR(45) NOT NULL COMMENT '端末' ,
  `browser_id` TINYINT NOT NULL COMMENT '1:標準ブラウザ　2:chrome　3:モバイル版　4:デスクトップ版' ,
  `build_version` VARCHAR(45) NOT NULL ,
  `carrier_id` TINYINT NOT NULL ,
  `name` VARCHAR(45) NULL COMMENT 'モデル名' ,
  `user_agent` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`user_agent_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `u_user_agent` ON `user_agent` (`user_agent` ASC) ;

SHOW WARNINGS;
CREATE UNIQUE INDEX `u_model_version_browser` ON `user_agent` (`model` ASC, `browser_id` ASC, `build_version` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `media_distributor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `media_distributor` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `media_distributor` (
  `media_id` INT NOT NULL ,
  `distributor_id` INT NOT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`media_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `promote_mail_job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `promote_mail_job` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `promote_mail_job` (
  `promote_mail_job_id` INT NOT NULL AUTO_INCREMENT ,
  `campaign_id` INT NOT NULL ,
  `auth_user_id` INT(11) NOT NULL ,
  `executed_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  `results` TEXT NULL ,
  `snapshot` TEXT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`promote_mail_job_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `campaign_as_payor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `campaign_as_payor` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `campaign_as_payor` (
  `campaign_id` INT NOT NULL ,
  `trader_identifier` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '取引先ID' ,
  `trader_contact_identifier` VARCHAR(45) NOT NULL DEFAULT '' COMMENT '取引先担当者ID' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`campaign_id`) )
ENGINE = InnoDB
COMMENT = 'プロモーション毎の取引先';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `logcheck_job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `logcheck_job` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `logcheck_job` (
  `logcheck_id` INT NOT NULL ,
  `execute_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`logcheck_id`) )
ENGINE = InnoDB
COMMENT = 'ログチェックのジョブキュー';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `media_agency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `media_agency` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `media_agency` (
  `media_agency_id` TINYINT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`media_agency_id`) )
ENGINE = InnoDB
COMMENT = 'メディア側代理店';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `extract_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `extract_detail` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `extract_detail` (
  `extract_detail_id` INT NOT NULL AUTO_INCREMENT ,
  `auth_user_id` INT(11) NOT NULL ,
  `start_date` DATE NOT NULL ,
  `end_date` DATE NOT NULL ,
  `role` VARCHAR(32) NOT NULL ,
  `campaign_id` INT NULL DEFAULT NULL ,
  `media_id` INT NULL DEFAULT NULL ,
  `accept_state` TINYINT(1) NULL DEFAULT NULL ,
  `params` VARCHAR(255) NULL ,
  `output_columns` TEXT NULL ,
  `status` TINYINT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`extract_detail_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `extract_detail_job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `extract_detail_job` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `extract_detail_job` (
  `extract_detail_id` INT NOT NULL ,
  `execute_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`extract_detail_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `achieve_to_sync`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `achieve_to_sync` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `achieve_to_sync` (
  `achieve_id` CHAR(36) NOT NULL ,
  `forward_time` TIMESTAMP NULL ,
  `attempted` TINYINT NULL COMMENT '通知失敗回数' ,
  PRIMARY KEY (`achieve_id`) )
ENGINE = InnoDB
COMMENT = '同期成果情報';

SHOW WARNINGS;
CREATE INDEX `i_forward_time` ON `achieve_to_sync` (`forward_time` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `click_to_sync`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `click_to_sync` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `click_to_sync` (
  `click_id` BIGINT NOT NULL ,
  `forward_time` TIMESTAMP NULL ,
  `attempted` TINYINT NULL COMMENT '通知失敗回数' ,
  PRIMARY KEY (`click_id`) )
ENGINE = InnoDB
COMMENT = '同期クリック情報';

SHOW WARNINGS;
CREATE INDEX `i_forward_time` ON `click_to_sync` (`forward_time` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `summary_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `summary_detail` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `summary_detail` (
  `summary_detail_id` INT NOT NULL AUTO_INCREMENT ,
  `auth_user_id` INT(11) NOT NULL ,
  `start_datetime` DATETIME NOT NULL ,
  `end_datetime` DATETIME NOT NULL ,
  `name` VARCHAR(32) NULL ,
  `role` VARCHAR(32) NOT NULL ,
  `params` TEXT NULL DEFAULT NULL ,
  `output_columns` TEXT NULL DEFAULT NULL ,
  `status` TINYINT NULL DEFAULT NULL ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  PRIMARY KEY (`summary_detail_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `job_for_summary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job_for_summary` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `job_for_summary` (
  `summary_detail_id` INT NOT NULL ,
  `execute_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`summary_detail_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `achieve_change_job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `achieve_change_job` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `achieve_change_job` (
  `achieve_change_job_id` INT NOT NULL AUTO_INCREMENT ,
  `is_searched` TINYINT NULL DEFAULT 0 ,
  `is_executed` TINYINT NULL DEFAULT 0 ,
  `execute_time` DATETIME NULL ,
  PRIMARY KEY (`achieve_change_job_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `achieve_change_condition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `achieve_change_condition` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `achieve_change_condition` (
  `achieve_change_job_id` INT(11) NOT NULL ,
  `site_id` INT(11) NOT NULL ,
  `advertisement_identifier` VARCHAR(20) NOT NULL ,
  `achieve_change_search_type_id` INT(11) NOT NULL ,
  `auth_user_id` INT(11) NOT NULL ,
  `is_earnings` TINYINT(1) NULL DEFAULT 0 ,
  `is_expenses` TINYINT(1) NULL DEFAULT 0 ,
  `change_earnings` DECIMAL(9,4) NULL ,
  `change_expenses` DECIMAL(9,4) NULL ,
  `start_accepted_time` DATETIME NOT NULL ,
  `end_accepted_time` DATETIME NOT NULL ,
  `file_name` VARCHAR(255) NOT NULL ,
  `search_data` TEXT NOT NULL ,
  PRIMARY KEY (`achieve_change_job_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `achieve_change_data`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `achieve_change_data` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `achieve_change_data` (
  `achieve_change_job_id` INT(11) NOT NULL ,
  `achieve_id` CHAR(36) NOT NULL ,
  `status` TINYINT(1) NULL DEFAULT 0 ,
  `before_earnings` DECIMAL(9,4) NULL ,
  `before_expenses` DECIMAL(9,4) NULL ,
  `after_earnings` DECIMAL(9,4) NULL ,
  `after_expenses` DECIMAL(9,4) NULL ,
  PRIMARY KEY (`achieve_change_job_id`, `achieve_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `achieve_change_search_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `achieve_change_search_type` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `achieve_change_search_type` (
  `achieve_change_search_type_id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `value` VARCHAR(45) NULL ,
  PRIMARY KEY (`achieve_change_search_type_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `premium_for_media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `premium_for_media` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `premium_for_media` (
  `media_id` INT(11) NOT NULL COMMENT '景表法対応メディア' ,
  `premium_id` TINYINT(4) NOT NULL COMMENT '景表法ID' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '記入時間' ,
  PRIMARY KEY (`media_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `premium`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `premium` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `premium` (
  `premium_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '景表法ID' ,
  `name` VARCHAR(32) NOT NULL COMMENT '景表法名前' ,
  `role` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`premium_id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `api_access`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `api_access` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `api_access` (
  `media_id` INT NOT NULL ,
  `ip` VARCHAR(15) NOT NULL ,
  `date_time` DATETIME NOT NULL ,
  `number_of_accesses` INT NOT NULL DEFAULT 0 ,
  `request_available_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' ,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
  PRIMARY KEY (`media_id`, `ip`, `date_time`) )
ENGINE = InnoDB;

SHOW WARNINGS;
USE `tachyon` ;
USE `tachyon`;

DELIMITER $$

USE `tachyon`$$
DROP TRIGGER IF EXISTS `bi_click` $$
SHOW WARNINGS$$
USE `tachyon`$$












































CREATE DEFINER = 'tachyon-t'@'127.0.0.1' TRIGGER bi_click BEFORE INSERT ON click
FOR EACH ROW
INSERT INTO report SET
  date        = NEW.date,
  media_id    = NEW.media_id,
  campaign_id = NEW.campaign_id,
  click       = 1
ON DUPLICATE KEY UPDATE click = click + 1;
$$

SHOW WARNINGS$$

USE `tachyon`$$
DROP TRIGGER IF EXISTS `ai_click` $$
SHOW WARNINGS$$
USE `tachyon`$$














CREATE TRIGGER `ai_click` AFTER INSERT ON click FOR EACH ROW
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN

INSERT INTO click_to_sync SET
  click_id     = NEW.click_id,
  forward_time = NEW.last_update,
  attempted    = 0;

END
$$

SHOW WARNINGS$$

DELIMITER ;

DELIMITER $$

USE `tachyon`$$
DROP TRIGGER IF EXISTS `bu_achieve` $$
SHOW WARNINGS$$
USE `tachyon`$$






CREATE TRIGGER `bu_achieve` BEFORE UPDATE ON achieve FOR EACH ROW
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
DECLARE forward TINYINT;
IF ( OLD.is_accepted IS NULL OR ! OLD.is_accepted ) AND NEW.is_accepted THEN
    INSERT INTO report SET
        date                = DATE( NEW.accepted_time ),
        media_id            = NEW.media_id,
        campaign_id         = NEW.campaign_id,
        achieve             = 1,
        earnings            = NEW.earnings,
        additional_earnings = NEW.additional_earnings,
        expenses            = NEW.expenses,
        additional_expenses = NEW.additional_expenses
    ON DUPLICATE KEY UPDATE
        achieve             = achieve + 1,
        earnings            = earnings + NEW.earnings,
        additional_earnings = additional_earnings + NEW.additional_earnings,
        expenses            = expenses + NEW.expenses,
        additional_expenses = additional_expenses + NEW.additional_expenses;
    INSERT INTO report_by_advertisement SET
        date                = DATE( NEW.accepted_time ),
        media_id            = NEW.media_id,
        advertisement_id    = NEW.advertisement_id,
        achieve             = 1,
        earnings            = NEW.earnings,
        additional_earnings = NEW.additional_earnings,
        expenses            = NEW.expenses,
        additional_expenses = NEW.additional_expenses
    ON DUPLICATE KEY UPDATE
        achieve             = achieve + 1,
        earnings            = earnings + NEW.earnings,
        additional_earnings = additional_earnings + NEW.additional_earnings,
        expenses            = expenses + NEW.expenses,
        additional_expenses = additional_expenses + NEW.additional_expenses;
    SELECT mode & b'1000' INTO forward FROM media WHERE media_id = NEW.media_id;
    SELECT ( forward >> 3 ) & requisite.is_forward INTO forward FROM advertisement JOIN requisite USING( requisite_id ) WHERE advertisement_id = NEW.advertisement_id;
    IF forward THEN
        INSERT INTO achieve_to_forward SET
            achieve_id   = NEW.achieve_id,
            media_id     = NEW.media_id,
            forward_time = NEW.accepted_time,
            attempted    = 0;
    END IF;
    INSERT INTO achieve_to_sync SET
        achieve_id   = NEW.achieve_id,
        forward_time = NEW.accepted_time,
        attempted    = 0;
END IF;
END
$$

SHOW WARNINGS$$

USE `tachyon`$$
DROP TRIGGER IF EXISTS `bi_achieve` $$
SHOW WARNINGS$$
USE `tachyon`$$






CREATE TRIGGER `bi_achieve` BEFORE INSERT ON achieve FOR EACH ROW
-- Edit trigger body code below this line. Do not edit lines above this one
BEGIN
DECLARE forward TINYINT;
IF NEW.is_accepted THEN
    INSERT INTO report SET
        date                = DATE( NEW.accepted_time ),
        media_id            = NEW.media_id,
        campaign_id         = NEW.campaign_id,
        achieve             = 1,
        earnings            = NEW.earnings,
        additional_earnings = NEW.additional_earnings,
        expenses            = NEW.expenses,
        additional_expenses = NEW.additional_expenses
    ON DUPLICATE KEY UPDATE
        achieve             = achieve + 1,
        earnings            = earnings + NEW.earnings,
        additional_earnings = additional_earnings + NEW.additional_earnings,
        expenses            = expenses + NEW.expenses,
        additional_expenses = additional_expenses + NEW.additional_expenses;
    INSERT INTO report_by_advertisement SET
        date                = DATE( NEW.accepted_time ),
        media_id            = NEW.media_id,
        advertisement_id    = NEW.advertisement_id,
        achieve             = 1,
        earnings            = NEW.earnings,
        additional_earnings = NEW.additional_earnings,
        expenses            = NEW.expenses,
        additional_expenses = NEW.additional_expenses
    ON DUPLICATE KEY UPDATE
        achieve             = achieve + 1,
        earnings            = earnings + NEW.earnings,
        additional_earnings = additional_earnings + NEW.additional_earnings,
        expenses            = expenses + NEW.expenses,
        additional_expenses = additional_expenses + NEW.additional_expenses;
    SELECT mode & b'1000' INTO forward FROM media WHERE media_id = NEW.media_id;
    SELECT ( forward >> 3 ) & requisite.is_forward INTO forward FROM advertisement JOIN requisite USING( requisite_id ) WHERE advertisement_id = NEW.advertisement_id;
    IF forward THEN
        INSERT INTO achieve_to_forward SET
            achieve_id   = NEW.achieve_id,
            media_id     = NEW.media_id,
            forward_time = NEW.accepted_time,
            attempted    = 0;
    END IF;
    INSERT INTO achieve_to_sync SET
        achieve_id   = NEW.achieve_id,
        forward_time = NEW.accepted_time,
        attempted    = 0;
END IF;
END
$$

SHOW WARNINGS$$

DELIMITER ;

DELIMITER $$

USE `tachyon`$$
DROP TRIGGER IF EXISTS `bi_click_of_crosswall` $$
SHOW WARNINGS$$
USE `tachyon`$$












































CREATE DEFINER = 'tachyon-t'@'127.0.0.1' TRIGGER bi_click_of_crosswall BEFORE INSERT ON click_of_crosswall
FOR EACH ROW
INSERT INTO report_of_crosswall SET
  date              = NEW.date,
  cross_media_id    = NEW.cross_media_id,
  cross_campaign_id = NEW.cross_campaign_id,
  click             = 1
ON DUPLICATE KEY UPDATE click = click + 1;
$$

SHOW WARNINGS$$

DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (1, 2, '[iOS]ブック');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (2, 2, '[iOS]ビジネス');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (3, 2, '[iOS]教育');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (4, 2, '[iOS]エンターテインメント');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (5, 2, '[iOS]ファイナンス');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (6, 2, '[iOS]ゲーム');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (7, 2, '[iOS]健康&フィットネス');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (8, 2, '[iOS]ライフスタイル');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (9, 2, '[iOS]メディカル');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (10, 2, '[iOS]ミュージック');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (11, 2, '[iOS]ナビゲーション');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (12, 2, '[iOS]ニュース');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (13, 2, '[iOS]写真');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (14, 2, '[iOS]仕事効率化');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (15, 2, '[iOS]レファレンス');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (16, 2, '[iOS]ソーシャルネットワーキング');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (17, 2, '[iOS]スポーツ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (18, 2, '[iOS]旅行');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (19, 2, '[iOS]ユーティリティ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (20, 2, '[iOS]天気');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (21, 1, '[Universal]懸賞サイト・ポイントサイト');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (22, 1, '[Universal]ゲーム・おもちゃ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (23, 1, '[Universal]インターネット・通信・家電');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (24, 1, '[Universal]旅行・宿泊');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (25, 1, '[Universal]就職・転職・教育');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (26, 1, '[Universal]趣味・スポーツ・アウトドア');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (27, 1, '[Universal]住まい・引越し');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (28, 1, '[Universal]ファミリー・ペット');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (29, 1, '[Universal]投資・保険・マネー');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (30, 1, '[Universal]ビジネス・オフィス');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (31, 1, '[Universal]グルメ・ギフト・フラワー');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (32, 1, '[Universal]ファッション・アクセサリー');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (33, 1, '[Universal]美容・健康・医療');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (34, 1, '[Universal]着メロ・着うた');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (35, 1, '[Universal]デコメ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (36, 1, '[Universal]待受・きせかえ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (37, 1, '[Universal]その他');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (38, 3, '[Google Play]ゲーム');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (39, 3, '[Google Play]エンターテイメント');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (40, 3, '[Google Play]コミック');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (41, 3, '[Google Play]ショッピング');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (42, 3, '[Google Play]スポーツ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (43, 3, '[Google Play]ソーシャル');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (44, 3, '[Google Play]ツール');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (45, 3, '[廃止]テーマ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (46, 3, '[Google Play]ニュース&天気情報');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (47, 3, '[Google Play]ファイナンス');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (48, 3, '[Google Play]マルチメディア');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (49, 3, '[Google Play]ライフスタイル');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (50, 3, '[廃止]リファレンス');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (51, 3, '[Google Play]仕事効率化');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (52, 3, '[Google Play]健康');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (53, 3, '[Google Play]旅行');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (54, 3, '[Google Play]通信');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (55, 3, '[Google Play]ソフトウェアライブラリ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (56, 3, '[廃止]デモ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (57, 1, '[Universal]懸賞サイト・ポイントサイト（換金）');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (58, 1, '[Universal]占い');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (59, 2, '[iOS]Newsstand');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (60, 3, '[Google Play]ウィジェット');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (61, 3, '[Google Play]カスタマイズ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (62, 3, '[Google Play]ビジネス');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (63, 3, '[Google Play]ライブ壁紙');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (64, 3, '[Google Play]交通');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (65, 3, '[Google Play]写真');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (66, 3, '[Google Play]医療');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (67, 3, '[Google Play]天気');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (68, 3, '[Google Play]教育');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (69, 3, '[Google Play]書籍＆文献');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (70, 3, '[Google Play]音楽＆オーディオ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (71, 3, '[dメニュー]天気／ニュース');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (72, 3, '[dメニュー]テレビ／ラジオ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (73, 3, '[dメニュー]銀行');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (74, 3, '[dメニュー]証券／保険／カード／マネー');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (75, 3, '[dメニュー]乗換／地図・ナビ／交通');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (76, 3, '[dメニュー]旅行／ホテル');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (77, 3, '[dメニュー]グルメ／レシピ／クーポン');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (78, 3, '[dメニュー]求人');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (79, 3, '[dメニュー]住まい／生活情報／恋愛／育児');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (80, 3, '[dメニュー]健康／ビューティー／医学');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (81, 3, '[dメニュー]便利ツール／写真／辞書／学習');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (82, 3, '[dメニュー]ケータイセキュリティ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (83, 3, '[dメニュー]おサイフケータイ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (84, 3, '[dメニュー]タウン情報／行政');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (85, 3, '[dメニュー]企業／ブランド');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (86, 3, '[dメニュー]ショッピング');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (87, 3, '[dメニュー]ファッション／コスメ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (88, 3, '[dメニュー]デコメール／メール');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (89, 3, '[dメニュー]ＳＮＳ／投稿／Ｑ＆Ａ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (90, 3, '[dメニュー]音楽／メロディコール／ボイス');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (91, 3, '[dメニュー]動画');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (92, 3, '[dメニュー]アーティスト／芸能／映画情報');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (93, 3, '[dメニュー]ゲーム');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (94, 3, '[dメニュー]コミック／書籍');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (95, 3, '[dメニュー]占い');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (96, 3, '[dメニュー]きせかえ／待受／マチキャラ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (97, 3, '[dメニュー]スポーツ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (98, 3, '[dメニュー]クルマ／バイク／趣味');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (99, 3, '[dメニュー]パチ・スロ／公営競技／くじ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (100, 3, '[au Market]ゲーム');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (101, 3, '[au Market]ニュース・天気');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (102, 3, '[au Market]ビジネス');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (103, 3, '[au Market]ネット・コミュニケーション');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (104, 3, '[au Market]地図・交通');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (105, 3, '[au Market]グルメ');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (106, 3, '[au Market]ファイナンス');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (107, 3, '[au Market]スポーツ・健康');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (108, 3, '[au Market]エンターテイメント');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (109, 3, '[au Market]書籍');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (110, 3, '[au Market]ツール');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (111, 3, '[au Market]学び');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (112, 3, '[au Market]Widget');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (113, 3, '[au Market]ショッピング');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (114, 2, '[iOS]換金');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (115, 3, '[Google Play]換金');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (116, 2, '[iOS]auスマートパス');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (117, 3, '[Google Play]auスマートパス');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (118, 1, '[Universal]auスマートパス');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (119, 1, '[Universal]スゴ得');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (120, 2, '[iOS]スゴ得');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (121, 3, '[Google Play]スゴ得');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (122, 1, '[Universal]Y!プレミアム');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (123, 2, '[iOS]ブック(その他)');
INSERT INTO `category` (`category_id`, `platform_id`, `name`) VALUES (124, 3, '[Googleplay]コミック(その他)');

COMMIT;

-- -----------------------------------------------------
-- Data for table `requisite`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (1, 'インストール', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (2, '無料会員登録', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (3, '有料会員登録', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (4, 'キャンペーン・懸賞応募', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (5, '商品購入', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (6, 'サンプル請求', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (7, 'アンケート・モニター登録', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (8, '資料請求', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (9, '見積・査定', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (10, 'クレジットカード申込・発券', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (11, 'キャッシング申込・成約', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (12, '口座開設', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (13, '予約・来店', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (14, 'その他', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (15, '無料アプリインストール', '1');
INSERT INTO `requisite` (`requisite_id`, `name`, `is_forward`) VALUES (16, 'ポイントバック無し成果', '0');

COMMIT;

-- -----------------------------------------------------
-- Data for table `platform`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `platform` (`platform_id`, `name`) VALUES (1, 'Universal');
INSERT INTO `platform` (`platform_id`, `name`) VALUES (2, 'iOS');
INSERT INTO `platform` (`platform_id`, `name`) VALUES (3, 'Android');

COMMIT;

-- -----------------------------------------------------
-- Data for table `platform_compatibility`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `platform_compatibility` (`platform_id_of_media`, `platform_id_of_campaign`) VALUES (1, 1);
INSERT INTO `platform_compatibility` (`platform_id_of_media`, `platform_id_of_campaign`) VALUES (1, 2);
INSERT INTO `platform_compatibility` (`platform_id_of_media`, `platform_id_of_campaign`) VALUES (1, 3);
INSERT INTO `platform_compatibility` (`platform_id_of_media`, `platform_id_of_campaign`) VALUES (2, 1);
INSERT INTO `platform_compatibility` (`platform_id_of_media`, `platform_id_of_campaign`) VALUES (2, 2);
INSERT INTO `platform_compatibility` (`platform_id_of_media`, `platform_id_of_campaign`) VALUES (3, 1);
INSERT INTO `platform_compatibility` (`platform_id_of_media`, `platform_id_of_campaign`) VALUES (3, 3);

COMMIT;

-- -----------------------------------------------------
-- Data for table `supplier`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (1, 'AppDriver', '');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (2, 'ポイントプラス', 'PointPlus');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (3, 'AdMaker', '');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (4, 'GREEリワード', '');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (5, 'AppAdForce', 'AppAdForce');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (6, 'AD Counter', 'ADCounter');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (7, 'HAKARU', 'HAKARU');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (8, 'ngi Ad Platform', 'NgiAdPlatform');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (9, 'Advancement', 'Advancement');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (10, 'MobADME', 'Mobadme');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (11, 'MAD', 'MAD');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (12, 'ポイントプラス(即時付与なし)', 'PointPlus');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (13, 'AdStore', 'AdStore');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (14, 'TSPAd', 'TSPAd');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (15, 'DApps', 'DApps');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (16, 'SMAAD', 'SMAAD');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (17, 'xaid', 'XAID');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (18, 'AppDriverChina', 'AppDriverChina');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (19, 'mobalyze', 'Mobalyze');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (20, 'af-share', 'AfShare');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (21, 'afte mopo', 'Afte_Mopo');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (22, 'gmomars', 'GMOMars');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (23, 'CAMP', 'CAMP');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (24, 'ポイントプラス(GREE)', 'PointPlus');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (25, 'party', 'Party');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (26, 'Smart-C', 'SmartC');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (27, 'GreeRewardAsp', 'GreeRewardAsp');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (28, 'eeline', 'Eeline');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (29, 'Zucks', 'Zucks');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (30, 'ポイントプラス(Smart-C)', 'PointPlus');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (31, 'MAT', 'MAT');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (32, 'GreeAdTracking', 'GreeAdTracking');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (33, 'ad-x', 'ADX');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (34, 'AppsFlyer', 'AppsFlyer');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (35, 'ART', 'ART');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (36, 'xrwd', 'XRWD');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (37, 'Metaps', 'Metaps');
INSERT INTO `supplier` (`supplier_id`, `name`, `role`) VALUES (38, 'Aarki', 'Aarki');

COMMIT;

-- -----------------------------------------------------
-- Data for table `analytics_continent`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `analytics_continent` (`analytics_continent_id`, `code`, `name`) VALUES (1, 'AF', 'Africa');
INSERT INTO `analytics_continent` (`analytics_continent_id`, `code`, `name`) VALUES (2, 'AS', 'Asia');
INSERT INTO `analytics_continent` (`analytics_continent_id`, `code`, `name`) VALUES (3, 'EU', 'Europe');
INSERT INTO `analytics_continent` (`analytics_continent_id`, `code`, `name`) VALUES (4, 'NA', 'North America');
INSERT INTO `analytics_continent` (`analytics_continent_id`, `code`, `name`) VALUES (5, 'OC', 'Oceania');
INSERT INTO `analytics_continent` (`analytics_continent_id`, `code`, `name`) VALUES (6, 'SA', 'South America');

COMMIT;

-- -----------------------------------------------------
-- Data for table `market`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `market` (`market_id`, `platform_id`, `name`, `refund_period`) VALUES (1, 3, 'Google Play', 900);
INSERT INTO `market` (`market_id`, `platform_id`, `name`, `refund_period`) VALUES (2, 3, 'Off-Market', 0);
INSERT INTO `market` (`market_id`, `platform_id`, `name`, `refund_period`) VALUES (3, 3, 'docomo Market', 0);
INSERT INTO `market` (`market_id`, `platform_id`, `name`, `refund_period`) VALUES (4, 3, 'au Market', 0);
INSERT INTO `market` (`market_id`, `platform_id`, `name`, `refund_period`) VALUES (5, 3, 'SoftBank Market', 0);
INSERT INTO `market` (`market_id`, `platform_id`, `name`, `refund_period`) VALUES (6, 3, 'andronavi', 0);

COMMIT;

-- -----------------------------------------------------
-- Data for table `carrier`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `carrier` (`carrier_id`, `name`) VALUES (1, 'ALL');
INSERT INTO `carrier` (`carrier_id`, `name`) VALUES (2, 'docomo');
INSERT INTO `carrier` (`carrier_id`, `name`) VALUES (3, 'au');
INSERT INTO `carrier` (`carrier_id`, `name`) VALUES (4, 'SoftBank');

COMMIT;

-- -----------------------------------------------------
-- Data for table `market_compatibility`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (1, 1);
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (1, 2);
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (1, 3);
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (1, 4);
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (2, 1);
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (2, 2);
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (2, 3);
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (2, 4);
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (3, 2);
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (4, 3);
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (5, 4);
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (6, 1);
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (6, 2);
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (6, 3);
INSERT INTO `market_compatibility` (`market_id`, `carrier_id`) VALUES (6, 4);

COMMIT;

-- -----------------------------------------------------
-- Data for table `role`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `role` (`role_id`, `role`) VALUES (1, 'advanced_analytics');

COMMIT;

-- -----------------------------------------------------
-- Data for table `currency`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `currency` (`currency_id`, `name`, `symbol`) VALUES ('USD', '米ドル', '$');
INSERT INTO `currency` (`currency_id`, `name`, `symbol`) VALUES ('CAD', 'カナダドル', '$');
INSERT INTO `currency` (`currency_id`, `name`, `symbol`) VALUES ('EUR', '欧州ユーロ', '€');
INSERT INTO `currency` (`currency_id`, `name`, `symbol`) VALUES ('GBP', '英ポンド', '£');
INSERT INTO `currency` (`currency_id`, `name`, `symbol`) VALUES ('JPY', '日本円', '¥');
INSERT INTO `currency` (`currency_id`, `name`, `symbol`) VALUES ('AUD', '豪ドル', '$');

COMMIT;

-- -----------------------------------------------------
-- Data for table `analytics_receipt_price_level`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `analytics_receipt_price_level` (`analytics_receipt_price_level_id`, `currency_id`, `name`, `min`) VALUES (1, 'JPY', '0～149円', 0);
INSERT INTO `analytics_receipt_price_level` (`analytics_receipt_price_level_id`, `currency_id`, `name`, `min`) VALUES (2, 'JPY', '150～399円', 150);
INSERT INTO `analytics_receipt_price_level` (`analytics_receipt_price_level_id`, `currency_id`, `name`, `min`) VALUES (3, 'JPY', '400～699円', 400);
INSERT INTO `analytics_receipt_price_level` (`analytics_receipt_price_level_id`, `currency_id`, `name`, `min`) VALUES (4, 'JPY', '700～999円', 700);
INSERT INTO `analytics_receipt_price_level` (`analytics_receipt_price_level_id`, `currency_id`, `name`, `min`) VALUES (5, 'JPY', '1000～1499円', 1000);
INSERT INTO `analytics_receipt_price_level` (`analytics_receipt_price_level_id`, `currency_id`, `name`, `min`) VALUES (6, 'JPY', '1500～1999円', 1500);
INSERT INTO `analytics_receipt_price_level` (`analytics_receipt_price_level_id`, `currency_id`, `name`, `min`) VALUES (7, 'JPY', '2000～4999円', 2000);
INSERT INTO `analytics_receipt_price_level` (`analytics_receipt_price_level_id`, `currency_id`, `name`, `min`) VALUES (8, 'JPY', '5000円以上', 5000);

COMMIT;

-- -----------------------------------------------------
-- Data for table `analytics_receipt_num_level`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `analytics_receipt_num_level` (`analytics_receipt_num_level_id`, `name`, `min`) VALUES (1, '1回', 1);
INSERT INTO `analytics_receipt_num_level` (`analytics_receipt_num_level_id`, `name`, `min`) VALUES (2, '2回', 2);
INSERT INTO `analytics_receipt_num_level` (`analytics_receipt_num_level_id`, `name`, `min`) VALUES (3, '3回', 3);
INSERT INTO `analytics_receipt_num_level` (`analytics_receipt_num_level_id`, `name`, `min`) VALUES (4, '4～5回', 4);
INSERT INTO `analytics_receipt_num_level` (`analytics_receipt_num_level_id`, `name`, `min`) VALUES (5, '6～8回', 6);
INSERT INTO `analytics_receipt_num_level` (`analytics_receipt_num_level_id`, `name`, `min`) VALUES (6, '9～10回', 9);
INSERT INTO `analytics_receipt_num_level` (`analytics_receipt_num_level_id`, `name`, `min`) VALUES (7, '11～13回', 11);
INSERT INTO `analytics_receipt_num_level` (`analytics_receipt_num_level_id`, `name`, `min`) VALUES (8, '14～19回', 14);
INSERT INTO `analytics_receipt_num_level` (`analytics_receipt_num_level_id`, `name`, `min`) VALUES (9, '20回以上', 20);

COMMIT;

-- -----------------------------------------------------
-- Data for table `network`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `network` (`network_id`, `name`) VALUES (1, 'openfeint');
INSERT INTO `network` (`network_id`, `name`) VALUES (2, 'plus+');
INSERT INTO `network` (`network_id`, `name`) VALUES (3, 'GREE Platform for smartphone');

COMMIT;

-- -----------------------------------------------------
-- Data for table `distributor`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (1, 'アプリ', NULL);
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (2, 'ウェブ', NULL);
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (3, 'GREEリワードアプリ', NULL);
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (4, 'GREEリワードウェブ', NULL);
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (5, 'meetroid', 'Meetroid');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (6, 'metaps', 'Metaps');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (7, 'SMAAD', 'SMAAD');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (8, 'Smart-C', 'SmartC');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (9, 'ポケットアフィリエイト', 'Smaf');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (10, 'bictown', 'Bictown');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (11, 'meeti', 'Meeti');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (12, 'Mobage', 'Mobage');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (13, 'Mobadme', 'Mobadme');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (14, 'Zucks', 'Zucks');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (15, 'SponsorPay', 'SponsorPay');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (16, 'Aarki', 'Aarki');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (17, 'poncan', 'Poncan');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (18, 'ShotApp', NULL);
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (19, 'W3i', 'W3i');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (20, 'マクロライン', 'MacroLine');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (21, 'adcrops', 'Adcrops');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (22, 'GREE Reward ASP', 'GreeRewardAsp');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (23, 'Tapjoy', 'Tapjoy');
INSERT INTO `distributor` (`distributor_id`, `name`, `role`) VALUES (24, 'SponsorPayGmbH', 'SponsorPayGmbH');

COMMIT;

-- -----------------------------------------------------
-- Data for table `preference`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `preference` (`name`, `value`) VALUES ('ad_api', '0');

COMMIT;

-- -----------------------------------------------------
-- Data for table `auth_role`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `auth_role` (`auth_role_id`, `role_name`) VALUES (1, '参照可');
INSERT INTO `auth_role` (`auth_role_id`, `role_name`) VALUES (2, '参照可（一部）');
INSERT INTO `auth_role` (`auth_role_id`, `role_name`) VALUES (3, '使用不可');

COMMIT;

-- -----------------------------------------------------
-- Data for table `menu`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (1, 'home', 'ホーム', 'top left', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (2, 'home', 'ホーム', 'top right', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (3, 'home', 'ホーム', 'bottom left', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (4, 'home', 'ホーム', 'bottom right', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (5, 'requisite', '無料アプリインストール', '1,15', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (6, 'requisite', '有料アプリインストール', '1', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (7, 'requisite', '無料会員登録', '2,4,7', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (8, 'requisite', '月額会員登録', '3', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (9, 'requisite', 'カード発券/口座開設', '10,11,12', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (10, 'requisite', '商品購入', '5,6', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (11, 'requisite', 'その他', '8,9,13,14', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (12, 'category', 'ゲーム', '6,22,38,93,100', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (13, 'category', '本/雑誌', '1,40,59,69,94,109', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (14, 'category', 'ファイナンス', '5,29,47,73,74,106', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (15, 'category', '教育/人材/ビジネス', '2,3,25,30,62,68,78,102,111', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (16, 'category', 'エンターテインメント', '4,39,92,108', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (17, 'category', '旅行/ライフスタイル', '7,8,9,11,12,17,18,20,24,26,27,28,33,42,46,49,52,53,64,66,67,71,75,76,77,79,80,84,97,98,101,104,105,107', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (18, 'category', '動画/ミュージック', '10,34,48,70,72,90,91', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (19, 'category', 'ソーシャルネットワーキング', '16,43,89,103', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (20, 'category', 'ユーティリティー/ツール', '13,14,15,19,44,51,54,61,65,81,82,83,110', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (21, 'category', 'ショッピング', '31,32,41,86,87,113', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (22, 'category', '壁紙/デコメ', '35,36,60,63,88,96,112', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (23, 'category', '占い', '58,95', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (24, 'category', 'その他', '21,23,37,55,57,85,99', NULL, '2012-03-01 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (25, 'special', 'ガッポリ貯める!!', 'site.subscription_duration, advertisement.offer', NULL, '2012-08-22 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (26, 'special', '無料', '1,2,4,7,15', 'SoftbankMobile', '2013-04-15 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (27, 'special', '新着', 'campaign.start_time', 'SoftbankMobile', '2013-04-15 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (28, 'category', 'auスマートパス', '116,117,118', NULL, '2013-05-28 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (29, 'category', 'スゴ得', '119,120,121', NULL, '2013-05-28 00:00:00');
INSERT INTO `menu` (`menu_id`, `type`, `name`, `description`, `role`, `last_update`) VALUES (30, 'requisite', 'がっぽり', '3', 'SoftbankMobile', '2013-06-07 00:00:00');

COMMIT;

-- -----------------------------------------------------
-- Data for table `wall`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `wall` (`wall_id`, `name`) VALUES (1, 'オファーウォール');
INSERT INTO `wall` (`wall_id`, `name`) VALUES (2, 'クロスウォール');
INSERT INTO `wall` (`wall_id`, `name`) VALUES (3, 'インターステイシャル');

COMMIT;

-- -----------------------------------------------------
-- Data for table `media_agency`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `media_agency` (`media_agency_id`, `name`) VALUES (1, 'androider');

COMMIT;

-- -----------------------------------------------------
-- Data for table `achieve_change_search_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `achieve_change_search_type` (`achieve_change_search_type_id`, `name`, `value`) VALUES (1, 'achieve_id', 'achieve_id');
INSERT INTO `achieve_change_search_type` (`achieve_change_search_type_id`, `name`, `value`) VALUES (2, 'click_id', 'click_id');
INSERT INTO `achieve_change_search_type` (`achieve_change_search_type_id`, `name`, `value`) VALUES (3, 'client_user_info', 'identifier');

COMMIT;

-- -----------------------------------------------------
-- Data for table `premium`
-- -----------------------------------------------------
START TRANSACTION;
USE `tachyon`;
INSERT INTO `premium` (`premium_id`, `name`, `role`) VALUES (1, 'Gree用', 'Gree');
INSERT INTO `premium` (`premium_id`, `name`, `role`) VALUES (2, 'DeNA用', 'DeNA');

COMMIT;
