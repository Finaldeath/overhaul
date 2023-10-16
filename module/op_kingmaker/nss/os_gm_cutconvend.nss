//::///////////////////////////////////////////////
//:: os_gm_cutconv
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ends the cutscene if the dialog exits normally
    and destroys the Psionic Crystal.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: April 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oGem = GetItemPossessedBy(oPC, "q3_psionicgem");
    int nGem = GetLocalInt(oPC, "OS_PSIONIC_GEM")+1;

    SetLocalInt(oPC, "OS_PSIONIC_GEM",nGem);
    DestroyObject(oGem);
    DelayCommand(0.1, DestroyObject(OBJECT_SELF));

    SetCutsceneMode(oPC, FALSE);
}
