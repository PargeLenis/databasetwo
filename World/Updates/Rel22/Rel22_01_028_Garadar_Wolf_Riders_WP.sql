-- ----------------------------------------------------------------
-- This is an attempt to create a full transactional MaNGOS update
-- Now compatible with newer MySql Databases (v1.5)
-- ----------------------------------------------------------------
DROP PROCEDURE IF EXISTS `update_mangos`; 

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_mangos`()
BEGIN
    DECLARE bRollback BOOL  DEFAULT FALSE ;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `bRollback` = TRUE;

    -- Current Values (TODO - must be a better way to do this)
    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurStructure := (SELECT `structure` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cCurContent := (SELECT `content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);

    -- Expected Values
    SET @cOldVersion = '22'; 
    SET @cOldStructure = '01'; 
    SET @cOldContent = '027';

    -- New Values
    SET @cNewVersion = '22';
    SET @cNewStructure = '01';
    SET @cNewContent = '028';
                            -- DESCRIPTION IS 30 Characters MAX    
    SET @cNewDescription = 'Garadar Wolf Riders WP';

                        -- COMMENT is 150 Characters MAX
    SET @cNewComment = 'Garadar Wolf Riders WP';

    -- Evaluate all settings
    SET @cCurResult := (SELECT `description` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
    SET @cOldResult := (SELECT `description` FROM `db_version` WHERE `version`=@cOldVersion AND `structure`=@cOldStructure AND `content`=@cOldContent);
    SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

    IF (@cCurResult = @cOldResult) THEN    -- Does the current version match the expected version
        -- APPLY UPDATE
        START TRANSACTION;
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL BELOW -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

    -- ===========================================
	-- Pathing for Garadar Wolf Rider Entry: 19068
	-- ===========================================
	UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1306.285,`position_y`=6952.27,`position_z`=31.80549 WHERE `guid`=68369;
	UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=-1312.285,`position_y`=6940.27,`position_z`=31.40549,`orientation`=1.049322 WHERE `guid`=68368;

	DELETE FROM `creature_linking` WHERE `master_guid` IN (68369);
	INSERT INTO `creature_linking` VALUES (68368,68369,515);

	DELETE FROM `creature_movement` WHERE `id`=68369;
	INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
	(68369,1,-1306.285,6952.27,31.80549,0),
	(68369,2,-1297.114,6970.51,32.55774,0),
	(68369,3,-1286.846,6984.002,32.94885,0),
	(68369,4,-1294.647,6996.062,32.38757,0),
	(68369,5,-1325.328,7024.249,33.6833,0),
	(68369,6,-1348.238,7032.215,33.68893,0),
	(68369,7,-1368.992,7045.52,34.10938,0),
	(68369,8,-1386.631,7061.436,34.45948,0),
	(68369,9,-1394.578,7075.491,33.83854,0),
	(68369,10,-1398.298,7096.861,33.335,0),
	(68369,11,-1403.897,7125.299,33.58035,0),
	(68369,12,-1389.057,7138.8,33.99598,0),
	(68369,13,-1370.205,7156.964,33.61451,0),
	(68369,14,-1370.205,7156.964,33.61451,0),
	(68369,15,-1359.099,7166.051,33.47036,0),
	(68369,16,-1347.834,7156.16,33.48244,0),
	(68369,17,-1340.037,7146.628,33.13161,0),
	(68369,18,-1327.699,7131.039,33.02342,0),
	(68369,19,-1314.86,7100.454,35.69725,0),
	(68369,20,-1327.699,7131.039,33.02342,0),
	(68369,21,-1340.037,7146.628,33.13161,0),
	(68369,22,-1347.834,7156.16,33.48244,0),
	(68369,23,-1359.099,7166.051,33.47036,0),
	(68369,24,-1369.572,7157.438,33.394,0),
	(68369,25,-1386.934,7139.82,34.2103,0),
	(68369,26,-1403.897,7125.299,33.58035,0),
	(68369,27,-1398.298,7096.861,33.335,0),
	(68369,28,-1394.578,7075.491,33.83854,0),
	(68369,29,-1386.631,7061.436,34.45948,0),
	(68369,30,-1368.992,7045.52,34.10938,0),
	(68369,31,-1348.238,7032.215,33.68893,0),
	(68369,32,-1325.328,7024.249,33.6833,0),
	(68369,33,-1294.647,6996.062,32.38757,0),
	(68369,34,-1286.846,6984.002,32.94885,0),
	(68369,35,-1297.114,6970.51,32.55774,0),
	(68369,36,-1306.285,6952.27,31.80549,0),
	(68369,37,-1318.743,6930.187,31.66993,0),
	(68369,38,-1334.226,6909.456,31.35373,0),
	(68369,39,-1349.58,6892.065,30.41895,0),
	(68369,40,-1368.256,6872.903,30.07822,0),
	(68369,41,-1389.396,6856.315,28.70381,0),
	(68369,42,-1404.557,6849.696,27.38716,0),
	(68369,43,-1413.721,6831.764,26.72453,0),
	(68369,44,-1420.326,6810.526,27.59953,0),
	(68369,45,-1439.301,6791.51,28.34141,0),
	(68369,46,-1453.281,6768.101,27.12888,0),
	(68369,47,-1470.179,6739.332,25.1649,0),
	(68369,48,-1483.529,6716.287,24.14556,0),
	(68369,49,-1493.718,6694.826,24.19415,0),
	(68369,50,-1504.721,6664.285,24.20934,0),
	(68369,51,-1510.836,6642.756,22.9326,0),
	(68369,52,-1515.425,6620.579,21.01927,0),
	(68369,53,-1519.032,6604.414,20.89977,0),
	(68369,54,-1510.836,6642.756,22.9326,0),
	(68369,55,-1504.721,6664.285,24.20934,0),
	(68369,56,-1493.718,6694.826,24.19415,0),
	(68369,57,-1483.529,6716.287,24.14556,0),
	(68369,58,-1470.179,6739.332,25.1649,0),
	(68369,59,-1453.281,6768.101,27.12888,0),
	(68369,60,-1439.301,6791.51,28.34141,0),
	(68369,61,-1420.326,6810.526,27.59953,0),
	(68369,62,-1413.721,6831.764,26.72453,0),
	(68369,63,-1404.557,6849.696,27.38716,0),
	(68369,64,-1389.396,6856.315,28.70381,0),
	(68369,65,-1368.256,6872.903,30.07822,0),
	(68369,66,-1349.58,6892.065,30.41895,0),
	(68369,67,-1334.226,6909.456,31.35373,0),
	(68369,68,-1318.743,6930.187,31.66993,0);


	-- ===========================================
	-- Pathing for Garadar Wolf Rider Entry: 19068
	-- ===========================================
	UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1211.921,`position_y`=7410.358,`position_z`=27.81794 WHERE `guid`=68371;
	UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=-1212.921,`position_y`=7400.358,`position_z`=28.68889,`orientation`=2.005122 WHERE `guid`=68370;

	DELETE FROM `creature_linking` WHERE `master_guid` IN (68371);
	INSERT INTO `creature_linking` VALUES (68370,68371,515);

	DELETE FROM `creature_movement` WHERE `id`=68371;
	INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`) VALUES
	(68371,1,-1211.921,7410.358,27.81794,0),
	(68371,2,-1214.586,7425.123,25.99836,0),
	(68371,3,-1222.165,7481.616,21.67305,0),
	(68371,4,-1220.974,7497.774,20.48409,0),
	(68371,5,-1214.87,7518.328,19.43397,0),
	(68371,6,-1212.915,7540.512,18.40359,0),
	(68371,7,-1211.614,7556.853,17.56509,0),
	(68371,8,-1216.004,7573.963,16.24247,0),
	(68371,9,-1217.563,7593.355,14.74553,0),
	(68371,10,-1219.645,7606.309,13.68142,0),
	(68371,11,-1225.298,7625.371,12.251,0),
	(68371,12,-1229.663,7641.069,11.23986,0),
	(68371,13,-1237.146,7655.85,10.48808,0),
	(68371,14,-1242.923,7670.299,9.753622,0),
	(68371,15,-1240.828,7683.721,9.396078,0),
	(68371,16,-1250.555,7678.873,8.685507,0),
	(68371,17,-1237.549,7656.549,10.52263,0),
	(68371,18,-1229.939,7641.217,11.3557,0),
	(68371,19,-1225.466,7625.775,12.251,0),
	(68371,20,-1219.507,7606.408,13.66946,0),
	(68371,21,-1217.322,7593.599,14.80558,0),
	(68371,22,-1216.509,7573.793,16.26286,0),
	(68371,23,-1211.828,7556.847,17.56509,0),
	(68371,24,-1212.723,7540.783,18.39443,0),
	(68371,25,-1215.317,7518.904,19.44593,0),
	(68371,26,-1221.131,7497.735,20.48873,0),
	(68371,27,-1222.776,7482.632,21.6545,0),
	(68371,28,-1220.757,7459.46,23.17959,0),
	(68371,29,-1217.947,7442.052,24.55239,0),
	(68371,30,-1215.386,7427.643,25.71003,0),
	(68371,31,-1212.104,7411.986,27.62336,0),
	(68371,32,-1213.585,7392.814,29.7174,0),
	(68371,33,-1220.035,7371.12,33.57092,0),
	(68371,34,-1222.352,7358.362,34.27285,0),
	(68371,35,-1222.356,7341.586,34.02285,0),
	(68371,36,-1202.531,7331.909,34.10541,0),
	(68371,37,-1186.747,7320.795,34.03506,0),
	(68371,38,-1181.867,7303.457,34.13747,0),
	(68371,39,-1181.804,7297.336,34.78957,0),
	(68371,40,-1192.18,7249.516,35.21297,0),
	(68371,41,-1195.673,7231.294,42.2477,0),
	(68371,42,-1196.073,7218.396,48.50587,0),
	(68371,43,-1195.584,7229.94,43.06007,0),
	(68371,44,-1194.09,7244.866,35.06643,0),
	(68371,45,-1192.24,7248.374,35.16298,0),
	(68371,46,-1180.625,7296.229,34.84074,0),
	(68371,47,-1182.318,7302.35,34.07021,0),
	(68371,48,-1184.25,7317.054,34.17605,0),
	(68371,49,-1198.885,7329.619,34.02688,0),
	(68371,50,-1218.819,7338.442,34.02285,0),
	(68371,51,-1222.647,7357.911,34.27285,0),
	(68371,52,-1213.344,7392.449,29.94091,0);

        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
        -- -- PLACE UPDATE SQL ABOVE -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

        -- If we get here ok, commit the changes
        IF bRollback = TRUE THEN
            ROLLBACK;
            SHOW ERRORS;
            SELECT '* UPDATE FAILED *' AS `===== Status =====`,@cCurResult AS `===== DB is on Version: =====`;
        ELSE
            COMMIT;
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            -- UPDATE THE DB VERSION
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
            INSERT INTO `db_version` VALUES (@cNewVersion, @cNewStructure, @cNewContent, @cNewDescription, @cNewComment);
            SET @cNewResult := (SELECT `description` FROM `db_version` WHERE `version`=@cNewVersion AND `structure`=@cNewStructure AND `content`=@cNewContent);

            SELECT '* UPDATE COMPLETE *' AS `===== Status =====`,@cNewResult AS `===== DB is now on Version =====`;
        END IF;
    ELSE    -- Current version is not the expected version
        IF (@cCurResult = @cNewResult) THEN    -- Does the current version match the new version
            SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cCurResult AS `===== DB is already on Version =====`;
        ELSE    -- Current version is not one related to this update
            IF(@cCurResult IS NULL) THEN    -- Something has gone wrong
                SELECT '* UPDATE FAILED *' AS `===== Status =====`,'Unable to locate DB Version Information' AS `============= Error Message =============`;
            ELSE
                IF(@cOldResult IS NULL) THEN    -- Something has gone wrong
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SET @cOldResult = CONCAT('Rel',@cOldVersion, '_', @cOldStructure, '_', @cOldContent, ' - ','IS NOT APPLIED');
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                ELSE
                    SET @cCurVersion := (SELECT `version` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurStructure := (SELECT `STRUCTURE` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurContent := (SELECT `Content` FROM `db_version` ORDER BY `version` DESC, `STRUCTURE` DESC, `CONTENT` DESC LIMIT 0,1);
                    SET @cCurOutput = CONCAT(@cCurVersion, '_', @cCurStructure, '_', @cCurContent, ' - ',@cCurResult);
                    SELECT '* UPDATE SKIPPED *' AS `===== Status =====`,@cOldResult AS `=== Expected ===`,@cCurOutput AS `===== Found Version =====`;
                END IF;
            END IF;
        END IF;
    END IF;
END $$

DELIMITER ;

-- Execute the procedure
CALL update_mangos();

-- Drop the procedure
DROP PROCEDURE IF EXISTS `update_mangos`;

