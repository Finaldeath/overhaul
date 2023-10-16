//::///////////////////////////////////////////////
//:: Name hx_trig_demonh
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Causes Demon hand to talk to PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 24, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();

    if(GetIsPC(oPC))
    {
    // Do once
        if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
            AssignCommand(oPC, ClearAllActions(TRUE));
            AssignCommand(oPC, ActionStartConversation(oPC, "hx_demon_h_conv", TRUE, FALSE));
        }
    }
}
