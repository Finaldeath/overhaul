//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Turns Typhus hostile to the pc
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
void main()
{
    object oTyphus = GetObjectByTag("q2_typhus");
    object oPC = GetFirstPC();

    ChangeToStandardFaction(oTyphus,STANDARD_FACTION_HOSTILE);
    SetLocalInt(GetModule(),"OS_KILLTYPHUS",10);
    AssignCommand(oTyphus,ActionAttack(oPC));
}
