//::///////////////////////////////////////////////
//:: Beckett Attacks
//:: act_beck_hostile
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Beckett and his guards attack the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oGuard1 = GetObjectByTag("q2_beckguard",0);
    object oGuard2 = GetObjectByTag("q2_beckguard",1);
    object oPC = GetFirstPC();
    ChangeToStandardFaction(oGuard1,STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard2,STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(OBJECT_SELF,STANDARD_FACTION_HOSTILE);
    AssignCommand(oGuard1,ActionAttack(oPC));
    AssignCommand(oGuard2,ActionAttack(oPC));
    ActionAttack(oPC);
}
