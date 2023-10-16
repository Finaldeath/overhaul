//::///////////////////////////////////////////////
//:: Name q2a1_ent_mshoppe
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC had a henchman when they left the area
    for the telescope cutscene - return the henchman
    to his control
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Jan 29/03
//:://////////////////////////////////////////////
#include "x0_i0_henchman"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    //Sobrey will talk to PC after they see the cutscene
    if (GetLocalInt(oPC, "X2_SawUnivesityBattle") == 1)
    {
        object oSobrey = GetObjectByTag("Sobrey");
        AssignCommand(oSobrey, ActionStartConversation(oPC));

    }

    //Hire back any henchmen who were left here in the area.
    object oArea = OBJECT_SELF;
    string szTag = GetTag(oArea);
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    object oTomi = GetObjectByTag("x2_hen_tomi");
    object oSharwyn = GetObjectByTag("x2_hen_sharwyn");
    object oLinu = GetObjectByTag("x2_hen_linu");
    object oDaelan = GetObjectByTag("x2_hen_daelan");

    if (GetIsObjectValid(oDeekin) == TRUE)
    {
        if (GetTag(GetArea(oDeekin)) == szTag)
            HireHenchman(oPC, oDeekin);
    }
    if (GetIsObjectValid(oTomi) == TRUE)
    {
        if (GetTag(GetArea(oTomi)) == szTag)
            HireHenchman(oPC, oTomi);
    }
    if (GetIsObjectValid(oSharwyn) == TRUE)
    {
        if (GetTag(GetArea(oSharwyn)) == szTag)
            HireHenchman(oPC, oSharwyn);
    }
    if (GetIsObjectValid(oLinu) == TRUE)
    {
        if (GetTag(GetArea(oLinu)) == szTag)
            HireHenchman(oPC, oLinu);
    }
    if (GetIsObjectValid(oDaelan) == TRUE)
    {
        if (GetTag(GetArea(oDaelan)) == szTag)
            HireHenchman(oPC, oDaelan);
    }

}
