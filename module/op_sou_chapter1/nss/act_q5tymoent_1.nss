//::///////////////////////////////////////////////
//:: Name  act_q5tymoent_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Teleport the PC into the Dragon Cave
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 25/03
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"X1_TYMOEXITOPEN", 1);
    object oPC = GetPCSpeaker();
    //Destroy the Key
    object oKey = GetItemPossessedBy(oPC, "q5_Tymo_Exit");
    if (GetIsObjectValid(oKey) == TRUE)
        DestroyObject(oKey);
    //Teleport the PC
    effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    object oWP = GetWaypointByTag("wp_q5tymo_secretentrance");
    DelayCommand(2.0, AssignCommand(oPC, JumpToObject(oWP)));
}
