//::///////////////////////////////////////////////
//:: Name q4a_bessy_hb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will continue to move Bessy around
     if there are still things for her to do.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 10, 2003
//:://////////////////////////////////////////////

void main()
{
   if(GetLocalInt(OBJECT_SELF, "bessy_hb") == 1)
      SignalEvent(OBJECT_SELF, EventUserDefined(1001));
}
