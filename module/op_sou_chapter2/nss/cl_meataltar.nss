//::///////////////////////////////////////////////
//:: Meat Altar (OnClose)
//:: Cl_MeatAltar.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Fire the Weird effect as feedback that the
     player has done something of impact.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 21, 2003
//:://////////////////////////////////////////////

void main()
{
    object oMeat = GetItemPossessedBy(OBJECT_SELF, "GiantFlesh");

    if (oMeat != OBJECT_INVALID)
    {
        int iBiteCount = GetLocalInt(oMeat, "iBiteCount");
        iBiteCount++;
        SetLocalInt(oMeat, "iBiteCount", iBiteCount);

        //If the meat's been bitten three times, destroy and respawn it.
        if (iBiteCount == 3)
        {
            DestroyObject(oMeat);
            object oGiantCorpse = GetNearestObjectByTag("X0_CORPSE", OBJECT_SELF);
            CreateItemOnObject("giantflesh", oGiantCorpse);
        }

        //Deactivate all map notes
        int iNoteNum = 1;
        object oCornerNote = GetNearestObjectByTag("MapNote_Tentacle", OBJECT_SELF, iNoteNum);
        while (oCornerNote != OBJECT_INVALID)
        {
            SetMapPinEnabled(oCornerNote, FALSE);
            //Update Loop variables
            iNoteNum++;
            oCornerNote = GetNearestObjectByTag("MapNote_Tentacle", OBJECT_SELF, iNoteNum);
        }
        object oCenterNote = GetObjectByTag("MapNote_Tentacle_C");
        SetMapPinEnabled(oCenterNote, FALSE);

        //Activate the appropriate map note
        object oMapNote = GetNearestObjectByTag("MapNote_Tentacle", OBJECT_SELF);
        SetMapPinEnabled(oMapNote, TRUE);

        //Apply the Weird VFX to the appropriate spawn.
        effect eBeast = EffectVisualEffect(VFX_FNF_WEIRD);
        object oBeastSpawn = GetNearestObjectByTag("TentacleBeastCorner", OBJECT_SELF);
        location lBeastSpawn = GetLocation(oBeastSpawn);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eBeast, lBeastSpawn);

        //Give XP to everyone
        object oPC_XP = GetFirstPC();
        while (oPC_XP != OBJECT_INVALID)
        {
            int bXP = GetLocalInt(oPC_XP, "XP_Main_08");
            if (bXP == FALSE)
            {
                SetLocalInt(oPC_XP, "XP_Main_08", TRUE);
                int iXP = FloatToInt(GetJournalQuestExperience("Journ_Main_End") * 0.05);
                GiveXPToCreature(oPC_XP, iXP);
            }
            oPC_XP = GetNextPC();
        }
    }
}
