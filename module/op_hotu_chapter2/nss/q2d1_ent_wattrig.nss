//::///////////////////////////////////////////////
//:: Name q2d1_ent_wattrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The first time a PC enters this trigger they
    will get some clues about the illusionary nature
    of the illithids.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    FloatingTextStrRefOnCreature(85716, oPC);//"Something about the waterfall in front of you seems quite unreal."


}
