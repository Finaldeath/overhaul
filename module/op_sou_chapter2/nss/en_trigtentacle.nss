//::///////////////////////////////////////////////
//:: Tentacle Beast Trigger (OnEnter)
//:: En_TrigTentacle.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the Tentacle Beast OnEnter behavior
     for this quadrant.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 20, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    object oCenterSpawn = GetNearestObjectByTag("TentacleBeastCenter");
    float fPCDistance = GetDistanceToObject(oPC);
    int bCoolDown = GetLocalInt(OBJECT_SELF, "bCoolDown");

    if (GetIsPC(oPC) == TRUE)
    {
        //Provide a 10 second cool-down period before this trigger fires again.
        //Only deal with players who are not spawning in from 2nd Floor.
        if (fPCDistance > 2.0 && bCoolDown == FALSE)
        {
            //Deactivate the trigger and reactivate it in 10 seconds.
            SetLocalInt(OBJECT_SELF, "bCoolDown", TRUE);
            DelayCommand(10.0, SetLocalInt(OBJECT_SELF, "bCoolDown", FALSE));

            //Parse through all 4 altars to see if any have meat.
            int iAltarCount = 1;
            object oAltar = GetNearestObjectByTag("Winds_03_Altar", OBJECT_SELF, iAltarCount);
            object oMeat = OBJECT_INVALID;
            object oMeatAltar = OBJECT_INVALID;
            int iBiteCount;
            object oMeatHolder;

            while (iAltarCount <= 4)
            {
                oMeat = GetItemPossessedBy(oAltar, "GiantFlesh");
                if (oMeat != OBJECT_INVALID)
                {
                    oMeatAltar = oAltar;
                    iBiteCount = GetLocalInt(oMeat, "iBiteCount");
                    iBiteCount++;
                    SetLocalInt(oMeat, "iBiteCount", iBiteCount);

                    //If the meat's been bitten three times, destroy and respawn it.
                    if (iBiteCount == 3)
                    {
                        DestroyObject(oMeat);
    //                    oMeatHolder = GetNearestObjectByTag("MeatHolder", oMeatAltar, 2);
    //                    CreateItemOnObject("giantflesh", oMeatHolder);
                    }
                }

                //Update Loop variables
                iAltarCount++;
                oAltar = GetNearestObjectByTag("Winds_03_Altar", OBJECT_SELF, iAltarCount);
            }

            //The beast spawn defaults to the center one...
            object oBeastSpawn = GetNearestObjectByTag("TentacleBeastCenter");
            object oMapNote = GetNearestObjectByTag("MapNote_Tentacle_C");
            int iTotalWalkways = 4;

            //But if meat was found, identify the associated spawn point for
            //the beast.
            if (oMeatAltar != OBJECT_INVALID)
            {
                oBeastSpawn = GetNearestObjectByTag("TentacleBeastCorner", oMeatAltar);
                oMapNote = GetNearestObjectByTag("MapNote_Tentacle", oMeatAltar);
                iTotalWalkways = 2;
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
            SetMapPinEnabled(oMapNote, TRUE);

            //Apply the Weird VFX to the appropriate spawn.
            effect eBeast = EffectVisualEffect(VFX_FNF_WEIRD);
            location lBeastSpawn = GetLocation(oBeastSpawn);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eBeast, lBeastSpawn);

            //Apply the damaging effect to nearby walkways
            int iWalkwayCount = 1;
            object oWalkway = GetNearestObjectByTag("BeastBlastPoint", oBeastSpawn, iWalkwayCount);
            location lWalkway = GetLocation(oWalkway);
            while (iWalkwayCount <= iTotalWalkways)
            {
                //DelayCommand(2.5, AssignCommand(oBeastSpawn, ActionCastSpellAtLocation(SPELL_WALL_OF_FIRE, lWalkway, METAMAGIC_NONE, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
                DelayCommand(2.5, AssignCommand(oBeastSpawn, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_PER_WALLFIRE, "winds03_en_firew", "winds03_hb_firew"), lWalkway, 12.0)));
                //Update loop variables
                iWalkwayCount++;
                oWalkway = GetNearestObjectByTag("BeastBlastPoint", oBeastSpawn, iWalkwayCount);
                lWalkway = GetLocation(oWalkway);
            }
            iWalkwayCount = 1;
            object oWalkway_V = GetNearestObjectByTag("BeastBlastPoint_V", oBeastSpawn, iWalkwayCount);
            object oVerticalCaster = GetNearestObjectByTag("VerticalCaster");
            location lWalkway_V = GetLocation(oWalkway_V);
            while (iWalkwayCount <= iTotalWalkways)
            {
                //DelayCommand(2.5, AssignCommand(oVerticalCaster, ActionCastSpellAtLocation(SPELL_WALL_OF_FIRE, lWalkway_V, METAMAGIC_NONE, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
                DelayCommand(2.5, AssignCommand(oVerticalCaster, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_PER_WALLFIRE, "winds03_en_firew", "winds03_hb_firew"), lWalkway_V, 12.0)));

                //Update loop variables
                iWalkwayCount++;
                oWalkway_V = GetNearestObjectByTag("BeastBlastPoint_V", oBeastSpawn, iWalkwayCount);
                lWalkway_V = GetLocation(oWalkway_V);
            }
        }
    }
}
