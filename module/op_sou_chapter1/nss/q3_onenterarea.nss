//::///////////////////////////////////////////////
//:: Name q3_onenterarea
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if the cutscene is running when
    the area is entered - if it is, jump the pc
    to his multiplayer spot.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: March 31/03
//:://////////////////////////////////////////////
#include "x1_inc_cutscene"
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        SetLocalInt(GetModule(), "X1_Q3C_NUMPC", GetLocalInt(GetModule(), "X1_Q3C_NUMPC") + 1);
        if (GetLocalInt(oPC, "X1_JNAHAUTOSAVE") != 1)
        {
            SetLocalInt(oPC, "X1_JNAHAUTOSAVE", 1);
            DoSinglePlayerAutoSave();

        }
    }
    //if the cutscene is running
    if (GetLocalInt(GetModule(), "X1_CUT31RUNNING") == 1)
    {

        if (GetIsPlayerCharacter(oPC) == TRUE)
        {
            object oJnah = GetObjectByTag("Q3_JNAH");
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

            SetLocalInt(oPC, "nCutsceneNumber", 31);
            CutSetCutsceneMode(31, 0.0, oPC, TRUE);
            CutSetLocation(31, 0.0, oPC);
            CutFadeOutAndIn(31, 1.0, oPC);
            AssignCommand(oJnah, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oPC));
            CutJumpToObject(31, 3.75, oPC, GetObjectByTag("wp_q3cut31pcx"));


        }
    }
}

