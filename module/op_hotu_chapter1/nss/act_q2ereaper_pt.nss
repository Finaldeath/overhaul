//::///////////////////////////////////////////////
//:: Name: act_q2ereaper_pt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Send a request to each member of the PCs party
    to see if they would like to go to the realm
    of the reaper
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 17/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    location lPC;
    object oConverser;
    object oParty = GetFirstFactionMember(oPC, TRUE);
    //loop through the party and create a converser to ask each member if
    //they want to join the council meeting.
    while (oParty != OBJECT_INVALID)
    {
        if (GetIsPC(oParty) && GetName(oParty) != GetName(oPC))
        {
            lPC = GetLocation(oParty);
            oConverser = CreateObject(OBJECT_TYPE_PLACEABLE, "q2a1conversation", lPC);
            AssignCommand(oParty, ClearAllActions(TRUE));
            AssignCommand(oConverser, ActionStartConversation(oParty,"q2e_con_joincon",TRUE));
        }
        oParty = GetNextFactionMember(oPC, TRUE);
    }
}
