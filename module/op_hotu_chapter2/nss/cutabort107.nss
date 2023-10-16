//::///////////////////////////////////////////////
//:: Name cutabort107
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of Wave 4 Assault - Beholder Attack
    (this will jump the player right to the battle
    skipping cutscene 106 (the Mindflayer attack) as well.
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
    SetLocalInt(GetModule(), "X2_Cutscene107Aborted", 1);
    BlackScreen(oPC);
    //Get rid of any cutscene effects on the henchmen
    RemoveCutsceneEffects();


    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));

    // Cutscene actors and objects.
    object oBattleMaster = GetObjectByTag("q2abattle2master");

    object oGuard1 = GetObjectByTag("cut107_guard1");
    object oGuard2 = GetObjectByTag("cut107_guard2");

    object oBeholder1 = GetObjectByTag("cut107_beholder1");
    object oBeholder2 = GetObjectByTag("cut107_beholder2");

    if (GetIsObjectValid(oGuard1) == TRUE)
        DestroyObject(oGuard1);
    if (GetIsObjectValid(oGuard2) == TRUE)
        DestroyObject(oGuard2);
    if (GetIsObjectValid(oBeholder1) == TRUE)
        DestroyObject(oBeholder1);
    if (GetIsObjectValid(oBeholder2) == TRUE)
        DestroyObject(oBeholder2);


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
