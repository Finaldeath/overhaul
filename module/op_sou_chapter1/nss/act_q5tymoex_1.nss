//::///////////////////////////////////////////////
//:: Name  act_q5tymoex_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Teleport the PC out to the Nether Mountains
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 25/03
//:://////////////////////////////////////////////

void main()
{
    //Destroy the Key
    object oPC = GetPCSpeaker();
    object oKey = GetItemPossessedBy(oPC, "q5_Tymo_Exit");
    if (GetIsObjectValid(oKey) == TRUE)
        DestroyObject(oKey);

    SetLocalInt(GetModule(),"X1_TYMOEXITOPEN", 1);

    effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    object oWP = GetWaypointByTag("wp_q5tymo_secretexit");
    DelayCommand(2.0, AssignCommand(oPC, JumpToObject(oWP)));
}
