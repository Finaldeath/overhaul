//::///////////////////////////////////////////////
//:: M3Q2I_MORAGINIT
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Morag starts a conversation with the pc.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if(GetIsPC(oPC)
        && GetLocalInt(oPC,"NW_G_M3Q2I_INIT")==0)
    {
        AssignCommand(oPC,ClearAllActions());
        object oMorag = GetNearestObjectByTag("M3Q02G01MORA");
        AssignCommand(oMorag,ClearAllActions());
        AssignCommand(oMorag,ActionStartConversation(oPC));
        SetLocalInt(oPC,"NW_G_M3Q2I_INIT",1);
    }
}
