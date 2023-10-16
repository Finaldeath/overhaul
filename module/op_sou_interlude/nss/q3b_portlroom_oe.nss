// enter portal room.
// flag player as inside the room (need in the trigger's HB event)
// if player has finished the puzzle - start the cutscene

#include "nw_i0_plot"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;
    int nStatus = GetLocalInt(GetArea(OBJECT_SELF), "Q3B_PORTAL_STATUS");
    if(nStatus == 6) // puzzle is over -> time for cutscnene
    {
       int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_PORTAL_CUTSCENE_ONCE");
       if(nDoOnce == 1)
            return;
       SetLocalInt(GetArea(OBJECT_SELF), "DO_PORTAL_CUTSCENE_ONCE", 1);
       SetLocalObject(OBJECT_SELF, "CUTSCENE_PC", oPC);
       SignalEvent(OBJECT_SELF, EventUserDefined(101));
    }
    // flag pc as inside
    SetLocalInt(oPC, "Q3B_INSIDE_PORTAL_ROOM", 1);
}


