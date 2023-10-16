//::///////////////////////////////////////////////
//:: The Dead Wind (Trigger OnEnter)
//:: En_TrigDeadWind.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Trigger the Area's User-Defined event,
     thereby launching the Dead Wind end battle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 13, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");

    if (GetIsPC(oPC) == TRUE && bDoOnce == FALSE)
    {
        object oArea = GetArea(OBJECT_SELF);
        SignalEvent(oArea, EventUserDefined(5002));
        SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
    }
}
