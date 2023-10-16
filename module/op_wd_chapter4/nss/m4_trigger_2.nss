//::///////////////////////////////////////////////
//:: M4_TRIGGER_2.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
this is the on enter script if a trigger that encompasses the NPC who will be
initiating dialogue. Make sure to replace the value of sTag with the tag of
the NPC in question.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May (from Aidan)
//:: Created On: February 28, 2002
//:://////////////////////////////////////////////


void main()
{
    string sTag = "M4Q01A04NASH";
    object oNPC = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_" + sTag);
    object oPC = GetEnteringObject();
    if(GetIsPC(oPC) &&
       GetLocalInt(oPC,"NW_L_Init_" + GetTag(oNPC)) == FALSE &&
       IsInConversation(oNPC) == FALSE)
    {
        AssignCommand(oPC,ClearAllActions());
        AssignCommand(oNPC,ClearAllActions());
        AssignCommand(oNPC,ActionStartConversation(oPC));
    }
}
