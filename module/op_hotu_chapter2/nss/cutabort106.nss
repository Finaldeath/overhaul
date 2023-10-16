//::///////////////////////////////////////////////
//:: Name cutabort106
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of Wave 4 Assault - Mindflayer Attack
    (this will jump the player right to the battle)

*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Sept 19/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void RemoveCutsceneEffects();

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    SetLocalInt(GetModule(), "X2_Cutscene106Aborted", 1);
    BlackScreen(oPC);
    //Get rid of any cutscene effects on the henchmen
    RemoveCutsceneEffects();

    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));

    // Cutscene actors and objects.
    object oBattleMaster = GetObjectByTag("q2abattle2master");

    object oGuard1 = GetObjectByTag("cut106_guard1");
    object oGuard2 = GetObjectByTag("cut106_guard2");

    object oUmber1 = GetObjectByTag("cut106_mf1");
    object oUmber2 = GetObjectByTag("cut106_mf2");
    object oUmber3 = GetObjectByTag("cut106_mf3");

    object oMindflayer1 = GetObjectByTag("cut106_mf4");
    object oMindflayer2 = GetObjectByTag("cut106_mf5");

    if (GetIsObjectValid(oGuard1) == TRUE)
        DestroyObject(oGuard1);
    if (GetIsObjectValid(oGuard2) == TRUE)
        DestroyObject(oGuard2);
    if (GetIsObjectValid(oUmber1) == TRUE)
        DestroyObject(oUmber1);
    if (GetIsObjectValid(oUmber2) == TRUE)
        DestroyObject(oUmber2);
    if (GetIsObjectValid(oUmber3) == TRUE)
        DestroyObject(oUmber3);
    if (GetIsObjectValid(oMindflayer1) == TRUE)
        DestroyObject(oMindflayer1);
    if (GetIsObjectValid(oMindflayer2) == TRUE)
        DestroyObject(oMindflayer2);

    ExecuteScript("bat2_wave4", oBattleMaster);

    //Reenable the Herald
    object oHerald = GetObjectByTag("q2aherald");
    DelayCommand(1.0, SetLocalInt(oHerald, "nDoNotFollow", 0));
    DelayCommand(1.5, SignalEvent(oHerald, EventUserDefined(101)));
}

//Grab each PCs henchmen and remove the cutscene paralyze effect from them
void RemoveCutsceneEffects()
{
    //Do nothing if cutscene has aborted
    if (GetLocalInt(GetModule(), "X2_nCutscene110Aborted") == 1)
        return;

    int nCount;
    object oHench;
    effect eEffect;
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC) == TRUE)
    {
        nCount = 1;
        oHench = GetHenchman(oPC, nCount);
        while (GetIsObjectValid(oHench) == TRUE)
        {
            eEffect = GetFirstEffect(oHench);
            while (GetIsEffectValid(eEffect) == TRUE)
            {
                if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENE_PARALYZE)
                    RemoveEffect(oHench, eEffect);

                eEffect = GetNextEffect(oHench);
            }
            nCount = nCount + 1;
            oHench = GetHenchman(oPC, nCount);
        }
        oPC = GetNextPC();
    }


}
