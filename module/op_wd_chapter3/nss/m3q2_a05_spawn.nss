//::///////////////////////////////////////////////
//:: Name
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
  int nRandom = Random(10) + 1;
  DelayCommand(nRandom * 1.0, ActionDoCommand(SignalEvent(OBJECT_SELF, EventUserDefined(2003))));
}