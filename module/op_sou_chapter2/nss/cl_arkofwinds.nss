//::///////////////////////////////////////////////
//:: Ark of the 3 Winds (OnClose)
//:: Cl_ArkOfWinds.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Open the Temple of the Winds if all 3 Winds
     are now inside me.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 18, 2003
//:://////////////////////////////////////////////

void main()
{
    object oDarkWind = GetItemPossessedBy(OBJECT_SELF, "ITEM_DarkWind");
    object oWiseWind = GetItemPossessedBy(OBJECT_SELF, "ITEM_WiseWind");
    object oDeadWind = GetItemPossessedBy(OBJECT_SELF, "ITEM_DeadWind");
    int iDoOnce = GetLocalInt(OBJECT_SELF, "iDoOnce");

    if (oDarkWind != OBJECT_INVALID &&
        oWiseWind != OBJECT_INVALID &&
        oDeadWind != OBJECT_INVALID &&
        iDoOnce == FALSE)
    {
        object oArea = GetArea(OBJECT_SELF);
        object oBase1 = GetNearestObjectByTag("WindTowerDoor");
        object oBase2 = GetNearestObjectByTag("VFX_Base2");
        object oBase3 = GetNearestObjectByTag("VFX_Base3");
        location lBase1 = GetLocation(oBase1);
        location lBase2 = GetLocation(oBase2);
        location lBase3 = GetLocation(oBase3);
        vector vBase1 = GetPositionFromLocation(lBase1);
        vector vBase2 = GetPositionFromLocation(lBase2);
        vector vBase3 = GetPositionFromLocation(lBase3);
        vector vEffect1;
        vector vEffect2;
        vector vEffect3;
        location lEffect1;
        location lEffect2;
        location lEffect3;
        float fXMod1 = 0.0;
        float fXMod2 = 0.0;
        float fXMod3 = 0.0;
        float fYMod1 = 0.0;
        float fYMod2 = 0.0;
        float fYMod3 = 0.0;
        float fZMod = 10.0;
        float fDelay = 0.0;
        effect eVFX1 = EffectVisualEffect(VFX_IMP_SILENCE);
        effect eVFX2 = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
        effect eChunk = EffectVisualEffect(353);
        effect eLightning = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
        effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
        object oDoor;
        location lDoor;
        int iDoor1Destroyed = FALSE;
        int iDoor2Destroyed = FALSE;
        int iDoor3Destroyed = FALSE;

        while (fZMod > -1.0)
        {
            //Calculate the Effect locations
            vEffect1 = Vector(vBase1.x+fXMod1, vBase1.y+fYMod1, vBase1.z+fZMod);
            vEffect2 = Vector(vBase2.x+fXMod2, vBase2.y+fYMod2, vBase2.z+fZMod);
            vEffect3 = Vector(vBase3.x+fXMod3, vBase3.y+fYMod3, vBase3.z+fZMod);
            lEffect1 = Location(oArea, vEffect1, 0.0);
            lEffect2 = Location(oArea, vEffect2, 0.0);
            lEffect3 = Location(oArea, vEffect3, 0.0);

            //Play the effects
            DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX1, lEffect1));
            DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX2, lEffect1));
            DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX1, lEffect2));
            DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX2, lEffect2));
            DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX1, lEffect3));
            DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX2, lEffect3));

            //Destroy the appropriate wall section based on the effect's Z value
            if (0.99 > fZMod && fZMod < 1.01 && iDoor1Destroyed == FALSE)
            {
                oDoor = GetNearestObjectByTag("WindTowerDoor", OBJECT_SELF, 1);
                lDoor = GetLocation(oDoor);
                DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eChunk, lDoor));
                DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLightning, lDoor));
                DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eShake, lDoor));
                DestroyObject(oDoor, fDelay);
                iDoor1Destroyed = TRUE;
            }
            if (3.99 > fZMod && fZMod < 4.01 && iDoor2Destroyed == FALSE)
            {
                oDoor = GetNearestObjectByTag("WindTowerDoor", OBJECT_SELF, 2);
                lDoor = GetLocation(oDoor);
                DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eChunk, lDoor));
                DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLightning, lDoor));
                DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eShake, lDoor));
                DestroyObject(oDoor, fDelay);
                iDoor2Destroyed = TRUE;
            }
            if (6.99 > fZMod && fZMod < 7.01 && iDoor3Destroyed == FALSE)
            {
                oDoor = GetNearestObjectByTag("WindTowerDoor", OBJECT_SELF, 3);
                lDoor = GetLocation(oDoor);
                DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eChunk, lDoor));
                DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLightning, lDoor));
                DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eShake, lDoor));
                DestroyObject(oDoor, fDelay);
                iDoor3Destroyed = TRUE;
            }

            //Set up the looping variables
            fDelay = fDelay + 0.1;
            fXMod1 = fXMod1 + IntToFloat(Random(20)-10)/75;
            fXMod2 = fXMod2 + IntToFloat(Random(20)-10)/75;
            fXMod3 = fXMod3 + IntToFloat(Random(20)-10)/75;
            fYMod1 = fYMod1 + IntToFloat(Random(20)-10)/75;
            fYMod2 = fYMod2 + IntToFloat(Random(20)-10)/75;
            fYMod3 = fYMod3 + IntToFloat(Random(20)-10)/75;
            fZMod = fZMod - 0.1;
        }

        //Flag the Ark as having performed its duty.
        SetLocalInt(OBJECT_SELF, "iDoOnce", TRUE);

        //Add journal entry
        object oPC = GetLastClosedBy();
        AddJournalQuestEntry("Journ_Temple_End", 1, oPC, TRUE, TRUE);
        AddJournalQuestEntry("Journ_Winds_End", 1, oPC, TRUE, TRUE);

        //Remove other entries in this series
        RemoveJournalQuestEntry("Journ_Temple_10", oPC, TRUE, TRUE);
        RemoveJournalQuestEntry("Journ_Temple_20", oPC, TRUE, TRUE);
        RemoveJournalQuestEntry("Journ_Winds_10", oPC, TRUE, TRUE);
        RemoveJournalQuestEntry("Journ_Winds_20", oPC, TRUE, TRUE);
        RemoveJournalQuestEntry("Journ_Winds_30", oPC, TRUE, TRUE);
        RemoveJournalQuestEntry("Journ_Winds_40", oPC, TRUE, TRUE);

        //Give XP to everyone
        object oPC_XP = GetFirstPC();
        while (oPC_XP != OBJECT_INVALID)
        {
            int bXP = GetLocalInt(oPC_XP, "XP_Main_04");
            if (bXP == FALSE)
            {
                SetLocalInt(oPC_XP, "XP_Main_04", TRUE);
                int iXP = FloatToInt(GetJournalQuestExperience("Journ_Main_End") * 0.10);
                GiveXPToCreature(oPC_XP, iXP);

                //Warn players that they won't be able to come back.
                DelayCommand(fDelay, FloatingTextStrRefOnCreature(40572, oPC_XP, FALSE));
            }
            oPC_XP = GetNextPC();
        }

        //Have the Asabi Thralls make progress on the passageway
        int iThrallCount = 1;
        object oThrall = GetObjectByTag("AsabiLooter", iThrallCount);
        while (oThrall != OBJECT_INVALID)
        {
            //Destroy the nearest rubble pieces
            object oRubble = GetNearestObjectByTag("AsabiRubble", oThrall);
            DestroyObject(oRubble);

            //Update Loop variables
            iThrallCount++;
            oThrall = GetObjectByTag("AsabiLooter", iThrallCount);
        }

        //Auto-Save
        fDelay = fDelay + 1.0;
        DelayCommand(fDelay, DoSinglePlayerAutoSave());
    }
}
