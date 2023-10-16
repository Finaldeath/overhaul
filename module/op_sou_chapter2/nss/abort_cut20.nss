//::///////////////////////////////////////////////
//:: Cutscene 20 (OnAbort)
//:: abort_cut20.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle any abortion of cutscene 20
     Shadvar Lich cutscene
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 8, 2003
//:://////////////////////////////////////////////
#include "inc_cutscene_10"
void ReturnPlayers();
void RemoveCutInvis(object oCreature);
void UnFreezeAssociate(object oPlayers);
void RemoveAssociateEffects(object oCreature);

void main()
{
    //Find all PCs currently in Cutscene 20.

    ReturnPlayers();
}
void ReturnPlayers()
{
    //activate the 2 Shadovar encounters
    object oEnc1 = GetObjectByTag("w04Shadovar1");
    object oEnc2 = GetObjectByTag("w04Shadovar2");
    object oArea = GetArea(oEnc1);
    SetEncounterActive(TRUE, oEnc1);
    SetEncounterActive(TRUE, oEnc2);



    //Destroy all remaining cutscene NPCs

    object oWar1 = GetObjectByTag("cut20ShadWarrior1");
    object oWar2 = GetObjectByTag("cut20ShadWarrior2");
    object oWar3 = GetObjectByTag("cut20ShadWarrior3");
    //Set these bodies to be destroyable
    AssignCommand(oWar1, SetIsDestroyable(TRUE));
    AssignCommand(oWar2, SetIsDestroyable(TRUE));
    AssignCommand(oWar3, SetIsDestroyable(TRUE));


    object oToDestroy = GetFirstObjectInArea(oArea);
    while (oToDestroy != OBJECT_INVALID)
    {
        if (GetTag(oToDestroy) == "cut20_shadowlich")
            DestroyObject(oToDestroy, 6.0);
        else if (GetStringLeft(GetTag(oToDestroy), 3) == "cut")
            DestroyObject(oToDestroy);
        oToDestroy = GetNextObjectInArea(oArea);
    }


    //Return ALL PCs to starting positions if they joined the cutscene

    location lMainPC = GetLocation(GetWaypointByTag("wp_cut20mainpcreturn"));
    location lPCX = GetLocation(GetWaypointByTag("wp_cut20pcxreturn"));
    //PC movement locations
    object oPlayers = GetFirstPC();
    int nCutsceneNumber = 20;
    while (oPlayers != OBJECT_INVALID)
    {
        if (GetLocalInt(oPlayers, "nCutsceneNumber") == nCutsceneNumber)
        {

            SetPlotFlag(oPlayers, FALSE);
            FadeToBlack(oPlayers, FADE_SPEED_FASTEST);

            if (GetLocalInt(oPlayers, "bMainPC_Cut20") == 1)
            {
                AssignCommand(oPlayers, ClearAllActions());
                DelayCommand(1.6, AssignCommand(oPlayers, JumpToLocation(lMainPC)));

                //CutJumpToLocation(nCutsceneNumber, 1.6, oPlayers, lMainPC, FALSE);
            }
            else
            {
                AssignCommand(oPlayers, ClearAllActions());
                DelayCommand(1.6, AssignCommand(oPlayers, JumpToLocation(lPCX)));
                //CutJumpToLocation(nCutsceneNumber, 1.6, oPlayers, lPCX, FALSE);

            }
            DelayCommand(2.5, RemoveCutInvis(oPlayers));
            DelayCommand(3.0, FadeFromBlack(oPlayers, FADE_SPEED_FAST));
            DelayCommand(3.0, SetCutsceneMode(oPlayers, FALSE));
            SetLocalInt(oPlayers, "nCutsceneNumber", 0);
        }

        oPlayers = GetNextPC();
    }
    SetLocalInt(GetModule(), "X1_CUT20RUNNING", 0);
}
void RemoveCutInvis(object oCreature)
{
    object oLich = GetObjectByTag("cut20_shadowlich");
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if (GetName(GetEffectCreator(eEff1)) == GetName(oLich))
        {
            RemoveEffect(oCreature, eEff1);
        }
        eEff1 = GetNextEffect(oCreature);
    }
    UnFreezeAssociate(oCreature);
}


void UnFreezeAssociate(object oPlayers)
{

 //Cutscene Paralize any associates.
        object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPlayers);
        if (oHench != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oHench);
        }
        object oCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPlayers);
        if (oCompanion != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oCompanion);
        }
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPlayers);
        if (oFamiliar != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oFamiliar);
        }
        object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPlayers);
        if (oSummon != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oSummon);
        }
        object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPlayers);
        if (oDominated != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oDominated);
        }
}
void RemoveAssociateEffects(object oCreature)
{
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if (GetEffectType(eEff1) == EFFECT_TYPE_CUTSCENE_PARALYZE)
        {
            RemoveEffect(oCreature, eEff1);
        }
        eEff1 = GetNextEffect(oCreature);
    }
}
