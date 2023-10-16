//::///////////////////////////////////////////////
//:: Break in the Eckel DOor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_M3Q2C06NOMOREUSER") == 1)
      return;

    switch(GetUserDefinedEventNumber())
    {
        case 8642:
            object oDoor =   GetObjectByTag("Eckelshomestead");
            if (GetLocked(oDoor) == TRUE)
            {
                ClearAllActions();
                DelayCommand(3.0, SignalEvent(OBJECT_SELF,EventUserDefined(8642)));
                SetLocked(oDoor, FALSE);
                DelayCommand(3.0, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
                ActionAttack(oDoor);
            }
            // else go other side
            else
            {
                ClearAllActions();
                JumpToObject(GetObjectByTag("M3Q2C06_DOOR_DEST"));
                SetLocalInt(OBJECT_SELF,"NW_L_M3Q2C06NOMOREUSER",1);
                ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
            }

        break;
    }
}
