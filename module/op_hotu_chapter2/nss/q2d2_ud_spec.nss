//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q2d2_ud_spec
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Fight Club Spectator - interact with the viewing
    ports every now and then..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 18/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        // Do nothing if gone hostile
        if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") > 0)
            return;

        if (GetLocalInt(OBJECT_SELF, "nInteracting") == 1)
            return;

        SetLocalInt(OBJECT_SELF, "nInteracting", 1);
        object oPort = GetNearestObjectByTag("q2d2pitport");

        if (  GetDistanceBetween(OBJECT_SELF, oPort ) < 1.5f)
        {
            ActionMoveAwayFromObject(oPort, FALSE, 1.5f);
        }
        ActionMoveToObject(oPort, FALSE, 1.5f);
        ActionDoCommand(SetFacingPoint(GetPositionFromLocation(GetLocation(oPort))));
        ActionWait(0.5f);
        //ActionCastFakeSpellAtObject(716, oPort);
        DelayCommand(12.0 + IntToFloat(Random(12)), SetLocalInt(OBJECT_SELF, "nInteracting", 0));
    }



}
