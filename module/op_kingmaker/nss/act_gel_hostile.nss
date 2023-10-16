//::///////////////////////////////////////////////
//:: Gelani Attacks
//:: act_gel_hostile
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gelani and her guards attack the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oGuard1 = GetObjectByTag("q2_gelguard",0);
    object oGuard2 = GetObjectByTag("q2_gelguard",1);
    int iGuards = GetLocalInt(GetModule(), "OS_KILLGELANI_G");

    if(iGuards == 10)
    {
        ChangeToStandardFaction(oGuard1, STANDARD_FACTION_HOSTILE);
        ChangeToStandardFaction(oGuard2, STANDARD_FACTION_HOSTILE);
        AssignCommand(oGuard1,ActionAttack(oPC));
        AssignCommand(oGuard2,ActionAttack(oPC));
    }

    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
    ActionAttack(oPC);
}
