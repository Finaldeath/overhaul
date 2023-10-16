//::///////////////////////////////////////////////
//:: act_mw_aliasend
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The light destroys itself; Alias starts a conversation with the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////
//:: Modified By: Keith K2 Hayward
//:: Modified On: April 2004
//:://////////////////////////////////////////////
void main()
{
    object oAlias = GetObjectByTag("q2_alias");
    object oPC = GetFirstPC();
    AssignCommand(oPC,ClearAllActions(TRUE));
    AssignCommand(oAlias,JumpToObject(oPC));
    AssignCommand(oAlias,ActionStartConversation(oPC));

    // Make sure the light is correctly destroyed and ensure the PC isn't
    // stuck in enternal cutscene mode :(
    ExecuteScript("q3ai_mw_endconv", OBJECT_SELF);
}
