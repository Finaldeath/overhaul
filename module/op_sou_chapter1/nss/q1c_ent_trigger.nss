//::///////////////////////////////////////////////
//:: Name q1c_ent_trigger
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    First time entered - the herbalist will speak
    a one liner...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 5/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") != 1 && GetIsPC(GetEnteringObject()) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        object oHerbalist = GetObjectByTag("q1cfarghan");
        AssignCommand(oHerbalist, SetFacingPoint(GetPosition(GetEnteringObject())));
        AssignCommand(oHerbalist, SpeakStringByStrRef(40360));

    }
}
