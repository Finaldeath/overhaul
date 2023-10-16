//::///////////////////////////////////////////////
//:: Name  q3c_cut31abort
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cutscene 31 - J'nah's cutscene.
    Get rid of the hooded figure and return PCs
    to their starting places.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 8/02
//:://////////////////////////////////////////////
#include "nw_i0_tool"
#include "x1_inc_cutscene"

void ReturnPlayers();
void RemoveCutInvis(object oCreature);
void UnFreezeAssociate(object oPlayers);
void RemoveAssociateEffects(object oCreature);
void main()
{
    SetLocalInt(GetModule(), "X1_CUT31RUNNING", 0);//**
    //Fade All PCs to Black
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        if (GetLocalInt(oPC, "nCutsceneNumber") == 31)
        {
            //**CutFadeOutAndIn(31, 0.0, oPC, FALSE);
            FadeToBlack(oPC, FADE_SPEED_FASTEST);
            DelayCommand(3.5, FadeFromBlack(oPC));
            AssignCommand(oPC, ClearAllActions(TRUE));
        }
        oPC = GetNextPC();
    }

    //Destroy All Objects that need destroying
    object oFigure = GetObjectByTag("Q3_HOODED_FIGURE");
    object oArea = GetArea(oFigure);
    //Change background music
    MusicBackgroundChangeDay(oArea, TRACK_CITYSLUMNIGHT);
    MusicBackgroundChangeNight(oArea, TRACK_CITYSLUMNIGHT);
    MusicBackgroundPlay(oArea);
    if (GetIsObjectValid(oFigure) == TRUE)
        DestroyObject(oFigure);

    //Return ALL PCs to starting positions if they joined the cutscene


    ReturnPlayers();

    //**SetLocalInt(GetModule(), "X1_CUT31RUNNING", 0);


}

void ReturnPlayers()
{
    //Return ALL PCs to starting positions if they joined the cutscene

    location lMainPC = GetLocation(GetWaypointByTag("wp_cut31mainpcreturn"));
    location lPCX = GetLocation(GetWaypointByTag("wp_cut31pcxreturn"));
    //PC movement locations
    object oPlayers = GetFirstPC();
    int nCutsceneNumber = 31;
    while (oPlayers != OBJECT_INVALID)
    {
        if (GetLocalInt(oPlayers, "nCutsceneNumber") == nCutsceneNumber)
        {
            //**CutFadeOutAndIn(nCutsceneNumber, 0.0, oPlayers, FALSE);
            //FadeToBlack(oPlayers, FADE_SPEED_FASTEST);
            //DelayCommand(2.0, FadeFromBlack(oPlayers));

            if (GetLocalInt(oPlayers, "nCUT31MAINPC") == 1)
            {

                //**CutJumpToLocation(nCutsceneNumber, 2.5, oPlayers, lMainPC, FALSE);
                DelayCommand(3.0, AssignCommand(oPlayers, JumpToLocation(lMainPC)));
            }
            else
            {
                //**CutJumpToLocation(nCutsceneNumber, 2.5, oPlayers, lPCX, FALSE);
                DelayCommand(3.0, AssignCommand(oPlayers, JumpToLocation(lPCX)));

            }
            DelayCommand(3.4, RemoveCutInvis(oPlayers));
           //**CutSetCutsceneMode(nCutsceneNumber, 3.0, oPlayers, FALSE);
            DelayCommand(3.4, SetCutsceneMode(oPlayers, FALSE));

            SetLocalInt(oPlayers, "nCutsceneNumber", 0);
        }

        oPlayers = GetNextPC();
    }
}
void RemoveCutInvis(object oCreature)
{
    object oJnah = GetObjectByTag("Q3_JNAH");
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if (GetName(GetEffectCreator(eEff1)) == GetName(oJnah))
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
        object oDominated = GetLocalObject(oPlayers, "oDominated");
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
