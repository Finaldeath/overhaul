//::///////////////////////////////////////////////
//:: Name hx_hench_rid
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Gets rid of henchmen traitors.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Nov 6, 2003
//:://////////////////////////////////////////////

// Jump henchmen that Meph has persuaded.
void JumpHenchmen(object oPC);

void main()
{
    JumpHenchmen(GetFirstPC());
}

void JumpHenchmen(object oPC)
{
    object oWP = GetObjectByTag("hx_end_battle_copy_spawn_wp");

    object oAribeth = GetNearestObjectByTag("H2_Aribeth", oPC);
    int iAribeth = GetLocalInt(GetModule(), "bAribethBetrays");
    object oDeekin = GetNearestObjectByTag("x2_hen_deekin", oPC);
    int iDeekin = GetLocalInt(GetModule(), "bDeekinBetrays");
    object oValen = GetNearestObjectByTag("x2_hen_valen", oPC);
    int iValen = GetLocalInt(GetModule(), "bValenBetrays");
    object oNathyrra = GetNearestObjectByTag("x2_hen_nathyra", oPC);
    int iNathyrra = GetLocalInt(GetModule(), "bNathyrraBetrays");

    if(iAribeth == TRUE)
    {
        AssignCommand(oAribeth, ClearAllActions(TRUE));
        AssignCommand(oAribeth, ActionJumpToObject(oWP));
        DelayCommand(0.5, AssignCommand(oAribeth, ActionJumpToObject(oWP)));
    }
    if(iDeekin == TRUE)
    {
        AssignCommand(oDeekin, ClearAllActions(TRUE));
        AssignCommand(oDeekin, ActionJumpToObject(oWP));
        DelayCommand(0.5, AssignCommand(oDeekin, ActionJumpToObject(oWP)));
    }
    if(iValen == TRUE)
    {
        AssignCommand(oValen, ClearAllActions(TRUE));
        AssignCommand(oValen, ActionJumpToObject(oWP));
        DelayCommand(0.5, AssignCommand(oValen, ActionJumpToObject(oWP)));
    }
    if(iNathyrra == TRUE)
    {
        AssignCommand(oNathyrra, ClearAllActions(TRUE));
        AssignCommand(oNathyrra, ActionJumpToObject(oWP));
        DelayCommand(0.5, AssignCommand(oNathyrra, ActionJumpToObject(oWP)));
    }
}
