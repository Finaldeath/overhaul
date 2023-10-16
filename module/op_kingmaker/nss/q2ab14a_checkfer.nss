//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Feran should be in the bar.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
void main()
{
    object oFeran = GetObjectByTag("q2_feran");
    object oBar = GetObjectByTag("q2ab_feran_drinks");
    int nDrinking = GetLocalInt(oFeran,"OS_FERANDRINKING");
    object oPC = GetEnteringObject();

    if (((GetIsNight() == TRUE) || (GetIsDusk() == TRUE))
      && (nDrinking == 10) && (GetIsPC(oPC) == TRUE))
    {
        AssignCommand(oFeran,ActionJumpToObject(oBar));
        SetLocalInt(oFeran,"OS_FERANATBAR",1);
    }
}

