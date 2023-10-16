//::///////////////////////////////////////////////
//:: Witch Wake 1: Module OnActivate
//:: WW1_OnActivate.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle all activated items
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 11, 2003
//:://////////////////////////////////////////////

void main()
{
    object oItem = GetItemActivated();
    object oActivator = GetItemActivator();
    object oTarget = GetItemActivatedTarget();
    location lTarget = GetItemActivatedTargetLocation();
    location lActivator = GetLocation(oActivator);
    string sItemTag = GetTag(oItem);

    //Witch Wake Handler
    if (sItemTag == "ww_plothandler")
    {
        //Delete the Handler if it's being used by a player.
        if (GetIsDM(oActivator) == FALSE)
        {
            string sHandlerError = "Sorry, only Dungeon Masters are allowed "+
                                   "to use the Witch Wake Handler.";
            SendMessageToPC(oActivator, sHandlerError);
            DestroyObject(oItem);
            return;
        }

        //Save the target out as a local so it can be referenced by the
        //conversation.
        SetLocalObject(oActivator, "WitchWakeHandler_Target", oTarget);

        //Have the activator launch the conversation with him/herself.
        AssignCommand(oActivator, ActionStartConversation(oActivator, "ww_plothandler", TRUE));
    }

    //Dice Bag
    else if (sItemTag == "DiceBag")
    {
        object oDicebagPlaceable = CreateObject(OBJECT_TYPE_PLACEABLE, "dicebag", lActivator);
        DelayCommand(1.0, AssignCommand(oDicebagPlaceable, ActionStartConversation(oActivator, "", TRUE)));
    }

    //Tracking Tool
    else if (sItemTag == "WW_Tracker")
    {
        object oArea = GetArea(oActivator);
        int iBaseDC = GetLocalInt(oArea, "iTrackDC");
        //Default to a DC of 10.
        if (iBaseDC == 0)
        {
            iBaseDC = 10;
        }
        int iNth = 1;
        object oTrackee = GetNearestObject(OBJECT_TYPE_CREATURE, oActivator, iNth);
        int iSearchRank = GetSkillRank(SKILL_SEARCH, oActivator);
        int iWisdomMod = GetAbilityModifier(ABILITY_WISDOM, oActivator);
        vector vTracker = GetPosition(oActivator);
        vector vTrackee;
        float fX;
        float fY;
        float fDistance;
        int iDistanceMod;
        int iFavoredEnemyMod;
        int iRacialType;
        int iDC;
        int iTrackCheck;
        int bTracklessStep;
        float fDirection;
        string sDirection;
        string sName;
        string sMessage;
        while (oTrackee != OBJECT_INVALID)
        {
            //Increase the DC for more distant creatures.
            fDistance = GetDistanceBetween(oActivator, oTrackee);
            iDistanceMod = FloatToInt(fDistance/5.0);

            //Decrease the DC if player has the trackee's racial type as a
            //favored enemy.
            iRacialType = GetRacialType(oTrackee);
            if ((iRacialType == RACIAL_TYPE_ABERRATION &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_ABERRATION, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_ANIMAL &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_ANIMAL, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_BEAST &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_BEAST, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_CONSTRUCT &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_CONSTRUCT, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_DRAGON &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_DRAGON, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_DWARF &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_DWARF, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_ELEMENTAL &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_ELEMENTAL, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_ELF &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_ELF, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_FEY &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_FEY, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_GIANT &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_GIANT, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_GNOME &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_GNOME, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_HUMANOID_GOBLINOID &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_GOBLINOID, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_HALFELF &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_HALFELF, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_HALFLING &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_HALFLING, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_HALFORC &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_HALFORC, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_HUMAN &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_HUMAN, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_MAGICAL_BEAST &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_MAGICAL_BEAST, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_HUMANOID_MONSTROUS &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_MONSTROUS, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_HUMANOID_ORC &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_ORC, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_OUTSIDER &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_OUTSIDER, oActivator) == TRUE) ||
//                (iRacialType = RACIAL_TYPE_OOZE &&
//                    GetHasFeat(FEAT_FAVORED_ENEMY_OOZE, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_HUMANOID_REPTILIAN &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_REPTILIAN, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_SHAPECHANGER &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_SHAPECHANGER, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_UNDEAD &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_UNDEAD, oActivator) == TRUE) ||
                (iRacialType == RACIAL_TYPE_VERMIN &&
                    GetHasFeat(FEAT_FAVORED_ENEMY_VERMIN, oActivator) == TRUE))
            {
                iFavoredEnemyMod = 5;
            }

            //If the Track Check is successful and the Trackee doesn't have the
            //Trackless Step feat...
            iDC = iBaseDC + iDistanceMod;
            iTrackCheck = d20() + iSearchRank + iWisdomMod + iFavoredEnemyMod;
            bTracklessStep = GetHasFeat(FEAT_TRACKLESS_STEP, oTrackee);

            if (iTrackCheck > iDC &&
                bTracklessStep == FALSE)
            {
                //Determine the direction of the Trackee.
                vTrackee = GetPosition(oTrackee);
                fX = vTrackee.x - vTracker.x;
                    //Prevent potential divide by 0 errors.
                    if (fX == 0.0)
                    {
                        fX = 0.1;
                    }
                fY = vTrackee.y - vTracker.y;
                fDirection = VectorToAngle(Vector(fX,fY,0.0));
                if (fDirection >= 348.75 || fDirection < 11.25)
                {
                    sDirection = "E";
                }
                else if (fDirection >= 11.25 && fDirection < 33.75)
                {
                    sDirection = "ENE";
                }
                else if (fDirection >= 33.75 && fDirection < 56.25)
                {
                    sDirection = "NE";
                }
                else if (fDirection >= 56.25 && fDirection < 78.75)
                {
                    sDirection = "NNE";
                }
                else if (fDirection >= 78.75 && fDirection < 101.25)
                {
                    sDirection = "N";
                }
                else if (fDirection >= 101.25 && fDirection < 123.75)
                {
                    sDirection = "NNW";
                }
                else if (fDirection >= 123.75 && fDirection < 146.25)
                {
                    sDirection = "NW";
                }
                else if (fDirection >= 146.25 && fDirection < 168.75)
                {
                    sDirection = "WNW";
                }
                else if (fDirection >= 168.75 && fDirection < 191.25)
                {
                    sDirection = "W";
                }
                else if (fDirection >= 191.25 && fDirection < 213.75)
                {
                    sDirection = "WSW";
                }
                else if (fDirection >= 213.75 && fDirection < 236.25)
                {
                    sDirection = "SW";
                }
                else if (fDirection >= 236.25 && fDirection < 258.75)
                {
                    sDirection = "SSW";
                }
                else if (fDirection >= 258.75 && fDirection < 281.25)
                {
                    sDirection = "S";
                }
                else if (fDirection >= 281.25 && fDirection < 303.75)
                {
                    sDirection = "SSE";
                }
                else if (fDirection >= 303.75 && fDirection < 326.25)
                {
                    sDirection = "SE";
                }
                else if (fDirection >= 326.25 && fDirection < 348.75)
                {
                    sDirection = "ESE";
                }

                //Get the creature's name
                sName = GetName(oTrackee);

                //Compile and send the feedback string.
                sMessage = sDirection+": "+sName;
                SendMessageToPC(oActivator, sMessage);
            }
            iNth++;
            oTrackee = GetNearestObject(OBJECT_TYPE_CREATURE, oActivator, iNth);
        }
        //Send feedback clarifying that the tracking attempt is now complete.
        DelayCommand(0.5, SendMessageToPC(oActivator, "Tracking Completed."));
    }

//////////////////////////////////////////////
// Items Specific to Witch Wake 1
//////////////////////////////////////////////
    //All DM Narration Items
    else if (sItemTag == "ww1_ahmedpike" ||    //The Prince's Pike obtainable from the Cairn plot in the Dawn area.
        sItemTag == "ww1_severedfinger" ||//Severed Finger obtainable from the Ragpicker
        sItemTag == "ww1_ironring" ||     //Iron Ring obtainable from the Ragpicker
        sItemTag == "ww1_gravehelm" ||    //The Rusted Helm obtainable from the Cemetery graves.
        sItemTag == "ww1_tarotanger" ||   //Child of Anger Tarot Card obtainable from the Night Hag
        sItemTag == "ww1_tarotfear" ||    //Child of Fear Tarot Card obtainable from the Night Hag
        sItemTag == "ww1_tarotpassion" || //Child of Passion Tarot Card obtainable from the Night Hag
        sItemTag == "ww1_tarotsorrow" ||  //Child of Sorrow Tarot Card obtainable from the Night Hag
        sItemTag == "ww1_tarotvirtue" ||  //Child of Virtue Tarot Card obtainable from the Night Hag
        sItemTag == "ww1_tarotfool" ||    //Fool Tarot Card obtainable from the Night Hag
        sItemTag == "ww1_tarotleader" ||  //Leader Tarot Card obtainable from the Night Hag
        sItemTag == "ww1_tarottraitor" || //Traitor Tarot Card obtainable from the Night Hag
        sItemTag == "ww1_nightshade" ||   //Deadly Nightshade purchasable from the Night Hag
        sItemTag == "ww1_untranslated")   //Untranslated Elven message copied from Guild Hall Exhibit
    {
        //Spawn in the Dungeon Master placeable, set the appropriate local, and
        //launch a conversation with the activator
        object oDMInvis = CreateObject(OBJECT_TYPE_PLACEABLE, "dm_itemhandler", lActivator);
        SetLocalString(oDMInvis, "CONV_ActivatingItem", sItemTag);
        DelayCommand(0.9, AssignCommand(oActivator, ClearAllActions(TRUE)));
        DelayCommand(1.0, AssignCommand(oDMInvis, ActionStartConversation(oActivator, "", TRUE)));
    }

    //Gravesword found in the Night Hag's cemetery and polished by Angmar...
    else if (sItemTag == "ww1_gravesword_p")
    {
        //Apply a VFX to location.
        effect eGleerider = EffectVisualEffect(VFX_FNF_SUNBEAM);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eGleerider, lTarget);

        //Spawn in an Elven Gleerider.
        object oGleerider = CreateObject(OBJECT_TYPE_CREATURE, "ww1_gleerider", lTarget);

        //Make the Gleerider laugh.
        PlayVoiceChat(VOICE_CHAT_LAUGH, oGleerider);
    }
}
