//::///////////////////////////////////////////////
//:: Name cutabort109
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of Wave 2 Assault - Dreugar Attack
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
    SetLocalInt(GetModule(), "X2_Cutscene109Aborted", 1);
    BlackScreen(oPC);
    //Get rid of any cutscene effects on the henchmen
    RemoveCutsceneEffects();

    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));

    // Cutscene actors and objects.
    object oBattleMaster = GetObjectByTag("q2abattle2master");

    object oGuard1 = GetObjectByTag("cut109_guard1");
    object oGuard2 = GetObjectByTag("cut109_guard2");

    object oBattleMage = GetObjectByTag("cut109_battlemage");
    object oDuergar1 = GetObjectByTag("cut109_duergar1");
    object oDuergar2 = GetObjectByTag("cut109_duergar2");
    object oDuergar3 = GetObjectByTag("cut109_duergar3");
    object oDuergar4 = GetObjectByTag("cut109_duergar4");
    object oDuergar5 = GetObjectByTag("cut109_duergar5");
    object oDuergar6 = GetObjectByTag("cut109_duergar6");

    object oBoneGolem = GetObjectByTag("cut109_bonegolem");

    if (GetIsObjectValid(oGuard1) == TRUE)
        DestroyObject(oGuard1);
    if (GetIsObjectValid(oGuard2) == TRUE)
        DestroyObject(oGuard2);
    if (GetIsObjectValid(oBattleMage) == TRUE)
        DestroyObject(oBattleMage);
    if (GetIsObjectValid(oDuergar1) == TRUE)
        DestroyObject(oDuergar1);
    if (GetIsObjectValid(oDuergar2) == TRUE)
        DestroyObject(oDuergar2);
    if (GetIsObjectValid(oDuergar3) == TRUE)
        DestroyObject(oDuergar3);
    if (GetIsObjectValid(oDuergar4) == TRUE)
        DestroyObject(oDuergar4);
    if (GetIsObjectValid(oDuergar5) == TRUE)
        DestroyObject(oDuergar5);
    if (GetIsObjectValid(oDuergar6) == TRUE)
        DestroyObject(oDuergar6);
    if (GetIsObjectValid(oBoneGolem) == TRUE)
        DestroyObject(oBoneGolem);
    ExecuteScript("bat2_wave2", oBattleMaster);

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
