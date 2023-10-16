//::///////////////////////////////////////////////
//:: Name cutabort101
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of appearance of matron's army cutscene
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  August 28/03
//:://////////////////////////////////////////////

void RemoveCutsceneEffects(object oHench);

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    SetLocalInt(GetModule(), "X2_Cutscene101Aborted", 1);
    BlackScreen(oPC);

    //Get rid of any cutscene effects on the henchmen
    int i = 1;
    effect eVis;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        RemoveCutsceneEffects(oHench);
        i++;
        oHench = GetHenchman(oPC, i);
    }
    DelayCommand(2.2, SetCameraFacing(0.0, 20.0, 60.0, CAMERA_TRANSITION_TYPE_SNAP));
    DelayCommand(2.5, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
    //Jump PC back to the battlefield.
    location lTarget = GetLocation(GetObjectByTag("mn_q2abat1_battlestart"));
    AssignCommand(oPC, JumpToLocation(lTarget));
    //Start the spawning of attackers.
    //Set Up the BattleMaster
    object oBattleMaster = GetObjectByTag("bat1_battlemaster");
    ExecuteScript("bat1_spawnatk", oBattleMaster);
}
void RemoveCutsceneEffects(object oHench)
{
    effect eEffect = GetFirstEffect(oHench);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        //if (GetEffectType(eEffect) == EFFECT_TYPE_INVISIBILITY) *THIS DOES NOT GET CUTSCENE INVIS
            RemoveEffect(oHench, eEffect);

        eEffect = GetNextEffect(oHench);
    }
}
