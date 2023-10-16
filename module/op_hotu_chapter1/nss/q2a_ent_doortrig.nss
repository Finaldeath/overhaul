//::///////////////////////////////////////////////
//:: Name q2a_ent_doortrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Front door of Yawning Portal Trigger: When this
    trigger is crossed - Grayban will initiate
    conversation with the PC and may unlock the
    door (he can be talked into it).
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 14/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    object oGrayban = GetObjectByTag("q2a_grayban");
    if (GetIsPC(oPC) == TRUE && GetLocalInt(oGrayban, "nTalked") != 1)
    {

        if (GetLocalInt(GetModule(), "NW_WELLROOMOPEN") == 10)
        {
            SetLocalInt(oGrayban, "nTalked", 1);
            AssignCommand(oGrayban, ActionStartConversation(oPC));
            DestroyObject(OBJECT_SELF, 10.0);
        }
    }
}
