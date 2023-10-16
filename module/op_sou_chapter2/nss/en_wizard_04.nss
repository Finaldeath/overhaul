//::///////////////////////////////////////////////
//:: High Arcanist's Chambers (OnEnter)
//:: En_Wizard_04.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check to see if the shadow lich cutscene
     (#20) is running when a new PC enters this
     area. Give XP for reaching the chambers.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 8, 2003
//:://////////////////////////////////////////////
#include "x1_inc_cutscene"

void main()
{
    object oPC = GetEnteringObject();
    if (GetLocalInt(GetModule(), "X1_CUT31RUNNING") == 1)
    {

        if (GetIsPC(oPC) == TRUE)
        {

            //Jump MultiPlayerPCs to their station..
            object oHench, oCompanion, oFamiliar, oSummon, oDominated;
            effect eAssociate = EffectCutsceneParalyze();

            //Cutscene Paralize any associates.
            oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
            if (oHench != OBJECT_INVALID)
            {
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oHench);
            }
            oCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
            if (oCompanion != OBJECT_INVALID)
            {
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oCompanion);
            }
            oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
            if (oFamiliar != OBJECT_INVALID)
            {
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oFamiliar);
            }
            oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
            if (oSummon != OBJECT_INVALID)
            {
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oSummon);
            }
            oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
            if (oDominated != OBJECT_INVALID)
            {
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oDominated);
            }

            SetLocalInt(oPC, "nCutsceneNumber", 20);
            SetPlotFlag(oPC, TRUE);
            CutSetCutsceneMode(20, 0.0, oPC, TRUE);
            CutSetLocation(20, 0.0, oPC);
            CutFadeOutAndIn(20, 1.0, oPC);
            CutApplyEffectToObject(20, 3.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY,
                           oPC, 9999.0);
            CutJumpToObject(20, 3.75, oPC, GetObjectByTag("wp_q3cut20pcx"));

            //Give the player XP if they haven't already received it.
            int bXP = GetLocalInt(oPC, "XP_Wizard_04");
            if (bXP == FALSE)
            {
                SetLocalInt(oPC, "XP_Wizard_04", TRUE);
                int iXP = FloatToInt(GetJournalQuestExperience("Journ_Wizard_End") * 0.10);
                GiveXPToCreature(oPC, iXP);
            }
        }
    }
}
