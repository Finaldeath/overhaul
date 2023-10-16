//::///////////////////////////////////////////////
//:: Name cutabort110
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of Wave 3 Assault - Drow Attack
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Sept 11/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void RemoveCutsceneEffects();

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    SetLocalInt(GetModule(), "X2_Cutscene110Aborted", 1);
    BlackScreen(oPC);
    //Get rid of any cutscene effects on the henchmen
    RemoveCutsceneEffects();



    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));

    // Cutscene actors and objects.
    object oBattleMaster = GetObjectByTag("q2abattle2master");

    object oGuard1 = GetObjectByTag("cut110_guard1");
    object oGuard2 = GetObjectByTag("cut110_guard2");

    object oBattleMage = GetObjectByTag("cut110_drowmage");
    object oDrow1 = GetObjectByTag("cut110_drow1");
    object oDrow2 = GetObjectByTag("cut110_drow2");
    object oDrow3 = GetObjectByTag("cut110_drow3");
    object oDrow4 = GetObjectByTag("cut110_drow4");
    object oDrow5 = GetObjectByTag("cut110_drow5");
    object oDrow6 = GetObjectByTag("cut110_drow6");

    if (GetIsObjectValid(oGuard1) == TRUE)
        DestroyObject(oGuard1);
    if (GetIsObjectValid(oGuard2) == TRUE)
        DestroyObject(oGuard2);
    if (GetIsObjectValid(oBattleMage) == TRUE)
        DestroyObject(oBattleMage);
    if (GetIsObjectValid(oDrow1) == TRUE)
        DestroyObject(oDrow1);
    if (GetIsObjectValid(oDrow2) == TRUE)
        DestroyObject(oDrow2);
    if (GetIsObjectValid(oDrow3) == TRUE)
        DestroyObject(oDrow3);
    if (GetIsObjectValid(oDrow4) == TRUE)
        DestroyObject(oDrow4);
    if (GetIsObjectValid(oDrow5) == TRUE)
        DestroyObject(oDrow5);
    if (GetIsObjectValid(oDrow6) == TRUE)
        DestroyObject(oDrow6);

    ExecuteScript("bat2_wave3", oBattleMaster);
    //Reenable the Herald
    object oHerald = GetObjectByTag("q2aherald");
    DelayCommand(1.0, SetLocalInt(oHerald, "nDoNotFollow", 0));
    DelayCommand(1.5, SignalEvent(oHerald, EventUserDefined(101)));
}
//Grab each PCs henchmen and remove the cutscene paralyze effect from them
void RemoveCutsceneEffects()
{
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
